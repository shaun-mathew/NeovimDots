local M = {
  "CRAG666/code_runner.nvim",
  cmd = {"RunCode", "RunFile", "RunClose"},
  config = function()
    require("code_runner").setup({
      mode = "toggleterm",
      focus = true,
      -- put here the commands by filetype
      filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        python = "python3 -u",
        typescript = "deno run",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
      },
    })
  end
}

return M
