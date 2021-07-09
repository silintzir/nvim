if require("lv-utils").check_lsp_client_active "tsserver" then
    return
end

local on_attach = function(client, bufnr)
    require "lsp".common_on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")

    ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = false,
        import_all_timeout = 5000, -- ms
        -- eslint
        eslint_enable_code_actions = true,
        eslint_enable_disable_comments = true,
        eslint_bin = O.lang.tsserver.linter,
        eslint_config_fallback = nil,
        eslint_enable_diagnostics = true,
        -- formatting
        enable_formatting = O.lang.tsserver.autoformat,
        formatter = O.lang.tsserver.formatter,
        formatter_config_fallback = nil,
        -- parentheses completion
        complete_parens = false,
        signature_help_in_parens = false,
        -- update imports on file move
        update_imports_on_move = false,
        require_confirmation_on_move = false,
        watch_dir = nil
    }

    ts_utils.setup_client(client)
end

require("lspconfig").tsserver.setup {
    cmd = {
        DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
        "--stdio"
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    on_attach = on_attach,
    root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    settings = {documentFormatting = false},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            {
                virtual_text = O.lang.tsserver.diagnostics.virtual_text,
                signs = O.lang.tsserver.diagnostics.signs,
                underline = O.lang.tsserver.diagnostics.underline,
                update_in_insert = true
            }
        )
    }
}

require("lsp.ts-fmt-lint").setup()
