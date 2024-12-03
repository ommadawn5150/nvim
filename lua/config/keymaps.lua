local vim = vim

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- jj で esc
keymap("i", "jj", "<ESC>", opts)

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- オプションテーブルに desc や buffer を追加する簡略化関数
local function ex_opts(desc, buffer)
  local final_opts = vim.tbl_extend("force", opts, {})
  if desc then
    final_opts.desc = desc
  end
  if buffer then
    final_opts.buffer = buffer
  end
  return final_opts
end

-- <Leader>の設定
vim.g.mapleader = " "

-- 標準的な操作
keymap("n", "<leader>w", ":w<cr>", ex_opts("Save"))
keymap("n", "<leader>wq", ":wq<cr>", ex_opts("Save and quit"))
keymap("n", "<leader>q", ":q<cr>", ex_opts("Quit"))
keymap("n", "<leader>Q", ":qall<cr>", ex_opts("Quit all"))

-- ウィンドウ操作
keymap("n", "<leader>|", ":vsplit<cr>", ex_opts("Vertical Split"))
keymap("n", "<leader>-", ":split<cr>", ex_opts("Horizontal Split"))

-- Plugin Manager Lazy.nvim
keymap("n", "<leader>Ls", ":Lazy sync<cr>", ex_opts("Lazy sync"))
keymap("n", "<leader>Lp", ":Lazy profile<cr>", ex_opts("Lazy profile"))

-- バッファ移動
keymap("n", "<C-n>", ":bnext<cr>", ex_opts("Next Buffer"))
keymap("n", "<C-p>", ":bprevious<cr>", ex_opts("Previous Buffer"))

-- NeoTree
keymap("n", "<leader>nn", ":Neotree toggle<cr>", ex_opts("Neotree Toggle"))
keymap("n", "<leader>no", ":Neotree reveal<cr>:Neotree ~/dotfiles/nvim/<cr>", ex_opts("Neotree reveal"))

-- 検索ハイライト解除
keymap("n", "<ESC>", ":noh<cr>", ex_opts("Reset Highlight Search"))

-- リモート
keymap("n", "<leader>rr", ":RemoteStart<cr>", ex_opts("RemoteStart"))
keymap("n", "<leader>ss", ":RemoteStart<cr>", ex_opts("RemoteStop"))

-- LSP関連のキーマッピングと設定
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- バッファローカルでのLSP設定
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- バッファローカルなキーマッピング
    keymap("n", "gD", vim.lsp.buf.declaration, ex_opts("Go to declaration", ev.buf))
    keymap("n", "gd", vim.lsp.buf.definition, ex_opts("Go to definition", ev.buf))
    keymap("n", "K", vim.lsp.buf.hover, ex_opts("Hover", ev.buf))
    keymap("n", "gi", vim.lsp.buf.implementation, ex_opts("Go to implementation", ev.buf))
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, ex_opts("Signature help", ev.buf))
    keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, ex_opts("Add workspace folder", ev.buf))
    keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, ex_opts("Remove workspace folder", ev.buf))
    keymap("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, ex_opts("List workspace folders", ev.buf))
    keymap("n", "<leader>D", vim.lsp.buf.type_definition, ex_opts("Go to type definition", ev.buf))
    keymap("n", "<leader>rn", vim.lsp.buf.rename, ex_opts("Rename", ev.buf))
    keymap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, ex_opts("Code action", ev.buf))
    keymap("n", "gr", vim.lsp.buf.references, ex_opts("References", ev.buf))
    keymap("n", "<leader><space>", function()
      vim.lsp.buf.format({ async = true })
    end, ex_opts("Format", ev.buf))

    -- Diagnostic mappings
    keymap("n", "<leader>e", vim.diagnostic.open_float, ex_opts("Open diagnostic float", ev.buf))
    keymap("n", "[d", vim.diagnostic.goto_prev, ex_opts("Go to previous diagnostic", ev.buf))
    keymap("n", "]d", vim.diagnostic.goto_next, ex_opts("Go to next diagnostic", ev.buf))
    keymap("n", "<leader>q", vim.diagnostic.setloclist, ex_opts("Set diagnostic loclist", ev.buf))

    -- Lspsaga キーマッピング
    keymap("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", ex_opts("Lspsaga Finder show references", ev.buf))
    keymap("n", "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", ex_opts("Lspsaga Hover Doc", ev.buf))
    keymap("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", ex_opts("Lspsaga Outline", ev.buf))
    keymap("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", ex_opts("Lspsaga Rename", ev.buf))
    keymap("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", ex_opts("Lspsaga Code Action", ev.buf))
  end,
})
