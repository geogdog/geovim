return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {
    ensure_installed = {
      "ansible-language-server",
      "azure-pipelines-language-server",
      "beautysh",
      "black",
      "flake8",
      "gopls",
      "helm-ls",
      "json-lsp",
      "lua-language-server",
      "marksman",
      "markdownlint",
      "pydocstyle",
      "pylint",
      "pyright",
      "shfmt",
      "stylua",
      "terraform-ls",
      "tflint",
      "yamllint",
      "yamlfmt",
    },
  },
  ---@param opts MasonSettings | {ensure_installed: string[]}
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    local function ensure_installed()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}