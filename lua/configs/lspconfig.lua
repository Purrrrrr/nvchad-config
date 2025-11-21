require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "eslint", "ts_ls", "clojure_lsp" }
vim.lsp.enable(servers)

vim.lsp.config("tailwindcss", {
  capabilities = capabilities,
  settings = {
    tailwindCSS = {
      classFunctions = {
        'clsx',
        'classNames',
        'className',
      }
    }
  }
})
vim.lsp.enable("tailwindcss")

vim.lsp.config['clj-kondo'] = {
  -- Command and arguments to start the server.
  cmd = { 'clj-kondo' },
  -- Filetypes to automatically attach to.
  filetypes = { 'clj' },
  -- Sets the "workspace" to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = { { 'project.clj', 'deps.edn', 'build.boot', 'shadow-cljs.edn', 'bb.edn' }, '.git' },
}

vim.lsp.enable("clj-kondo")

local function fix_all(opts)
  opts = opts or {}

  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
  vim.validate("bufnr", bufnr, "number")

  local client = opts.client or vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })[1]

  if not client then return end

  local request

  if opts.sync then
    request = function(buf, method, params) client:request_sync(method, params, nil, buf) end
  else
    request = function(buf, method, params) client:request(method, params, nil, buf) end
  end

  request(bufnr, "workspace/executeCommand", {
    command = "eslint.applyAllFixes",
    arguments = {
      {
        uri = vim.uri_from_bufnr(bufnr),
        version = vim.lsp.util.buf_versions[bufnr],
      },
    },
  })
end

vim.api.nvim_create_user_command("EslintFixAll", function() fix_all({ client = client, sync = true }) end, {})

-- read :h vim.lsp.config for changing options of lsp servers 
