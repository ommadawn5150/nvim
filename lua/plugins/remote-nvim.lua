local ssh_config = {
  ssh_binary = "ssh",
  scp_binary = "scp",
  ssh_config_file_paths = { "$HOME/.ssh/config" },
  ssh_prompts = {
    {
      match = "Enter passphrase for key",
      type = "secret", -- パスフレーズはシークレットとして扱う
      value_type = "static", -- 毎回新しいパスフレーズを入力するか
      value = "", -- 初期値
    },
    {
      match = "password:",
      type = "secret",
      value_type = "static",
      value = "",
    },
    {
      match = "continue connecting (yes/no/[fingerprint])?",
      type = "plain",
      value_type = "static",
      value = "",
    },
  },
}

return {
  require("remote-nvim").setup({
    ssh_config = ssh_config,
  }),
}
