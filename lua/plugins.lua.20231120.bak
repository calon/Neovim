local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.sqlite_clib_path = "C:\\Users\\Calon\\AppData\\Local\\nvim\\sqlite\\sqlite3.dll"

require("lazy").setup({
    -- 基础
    "neovim/nvim-lspconfig",
    -- { dir = "$VIM/plugin/nvim-lspconfig" },
    "nvim-lua/plenary.nvim",
    -- { dir = "$VIM/plugin/plenary.nvim" },
    "nvim-telescope/telescope.nvim",
    -- { dir = "$VIM/plugin/telescope.nvim" },
    { "nvim-telescope/telescope-frecency.nvim", tag = "0.1.4",
        -- config = function()
        --     require("telescope").load_extension "frecency"
        -- end,
        -- dependencies = {"kkharji/sqlite.lua"},
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "skywind3000/vim-quickui",
    -- { dir = "$VIM/plugin/vim-quickui" },
    -- { dir = "$VIM/plugin/mark" },
    { "itchyny/lightline.vim",
        lazy = false,
        priority = 1000,
    },
    -- "Yggdroot/LeaderF",

    -- 补全
    { "neoclide/coc.nvim", branch = "release", },
    -- { dir = "$VIM/plugin/coc.nvim" },
    "skywind3000/vim-dict",
    -- { dir = "$VIM/plugin/vim-dict" },

    -- 移动跳转
    { "phaazon/hop.nvim",
        config = function()
            require'hop'.setup { keys = 'jetovxqpdygfblzhckisuranmw' }
            vim.keymap.set('n', '<S-H>', function()
                require('hop').hint_patterns({multi_windows = true}, '..')
               -- require('hop').hint_anywhere({ multi_windows = true })
            end, {remap=true})
        end
    },
    "chaoren/vim-wordmotion",
    -- { dir = "$VIM/plugin/vim-wordmotion" },
    "zzhirong/vim-easymotion-zh",
    -- { dir = "$VIM/plugin/vim-easymotion-zh" },
    "easymotion/vim-easymotion",
    -- { dir = "$VIM/plugin/vim-easymotion" },
    "joeytwiddle/sexy_scroller.vim",
    -- { dir = "$VIM/plugin/sexy_scroller" },
    -- "Bekaboo/dropbar.nvim",

    -- 外观
    "rcarriga/nvim-notify",
    -- { dir = "$VIM/plugin/nvim-notify" },

    -- 快捷操作
    "KabbAmine/lazyList.vim",
    -- { dir = "$VIM/plugin/lazyList.vim" },
    "tomtom/tcomment_vim",
    -- { dir = "$VIM/plugin/Comment.nvim" },
    "junegunn/vim-easy-align",
    -- { dir = "$VIM/plugin/vim-easy-align" },
    "Konfekt/FastFold",
    -- { dir = "$VIM/plugin/FastFold" },
    "chrisgrieser/nvim-origami",
    "calon/escape_search",
    "vim-scripts/create_start_fold_marker.vim",
    -- { dir = "$VIM/plugin/create_start_fold_marker" },
    "calon/quicksave",
    -- { dir = "$VIM/plugin/quicksave",
    --   lazy = false,
    -- },
    "tpope/vim-repeat",
    --{ dir = "$VIM/plugin/vim-repeat" },
    "vim-scripts/SearchComplete",
    -- { dir = "$VIM/plugin/SearchComplete" },

    -- 文本处理
    "dhruvasagar/vim-table-mode",
    -- { dir = "$VIM/plugin/vim-table-mode" },
    "dkarter/bullets.vim",
    -- { dir = "$VIM/plugin/bullets.vim" },
    "hotoo/pangu.vim",
    -- { dir = "$VIM/plugin/pangu.vim" },
    "machakann/vim-sandwich",
    -- { dir = "$VIM/plugin/vim-sandwich" },
    "ralismark/opsort.vim",
    -- { dir = "$VIM/plugin/opsort.vim" },
    "godlygeek/tabular",
    -- { dir = "$VIM/plugin/tabular" },

    -- 笔记
    "calon/VOoM",
    -- { dir = "$VIM/plugin/voom",
    --   lazy = false,
    -- },

    -- { "jakewvincent/mkdnflow.nvim",
    --     -- lazy = false,
    --     init = function()
    --         require('mkdnflow').setup({
    --         -- Config goes here; leave blank for defaults
    --             modules = {
    --                 bib = true,
    --                 buffers = true,
    --                 conceal = true,
    --                 cursor = true,
    --                 folds = false,
    --                 links = true,
    --                 lists = true,
    --                 maps = true,
    --                 paths = true,
    --                 tables = true,
    --                 yaml = false
    --             },
    --             perspective = {
    --                 priority = 'current',
    --                 fallback = 'current',
    --                 root_tell = false,
    --                 nvim_wd_heel = false,
    --                 update = true
    --             },    
    --             links = {
    --                 style = 'markdown',
    --                 name_is_source = true,
    --                 conceal = false,
    --                 context = 0,
    --                 implicit_extension = 'md',
    --                 transform_implicit = false,
    --                 transform_explicit = false
    --             },
    --             mappings = {
    --                 MkdnEnter = {{'n', 'v'}, '<C-CR>'},
    --                 MkdnTab = false,
    --                 MkdnSTab = false,
    --                 MkdnNextLink = {'n', '<Tab>'},
    --                 MkdnPrevLink = {'n', '<S-Tab>'},
    --                 MkdnNextHeading = {'n', ']]'},
    --                 MkdnPrevHeading = {'n', '[['},
    --                 MkdnGoBack = {'n', '<BS>'},
    --                 MkdnGoForward = {'n', '<Del>'},
    --                 MkdnCreateLink = false, -- see MkdnEnter
    --                 MkdnCreateLinkFromClipboard = {{'n', 'v'}, '<leader>p'}, -- see MkdnEnter
    --                 MkdnFollowLink = false, -- see MkdnEnter
    --                 MkdnDestroyLink = {'n', '<M-CR>'},
    --                 MkdnTagSpan = {'v', '<M-CR>'},
    --                 MkdnMoveSource = {'n', '<C-F2>'},
    --                 MkdnYankAnchorLink = {'n', 'yaa'},
    --                 MkdnYankFileAnchorLink = {'n', 'yfa'},
    --                 MkdnIncreaseHeading = {'n', '+'},
    --                 MkdnDecreaseHeading = {'n', '-'},
    --                 MkdnToggleToDo = {{'n', 'v'}, '<C-Space>'},
    --                 MkdnNewListItem = false,
    --                 MkdnNewListItemBelowInsert = {'n', 'o'},
    --                 MkdnNewListItemAboveInsert = {'n', 'O'},
    --                 MkdnExtendList = false,
    --                 MkdnUpdateNumbering = {'n', '<leader>nn'},
    --                 -- MkdnTableNextCell = {'i', '<Tab>'},
    --                 -- MkdnTablePrevCell = {'i', '<S-Tab>'},
    --                 MkdnTableNextCell = false,
    --                 MkdnTablePrevCell = false,
    --                 MkdnTableNextRow = false,
    --                 MkdnTablePrevRow = {'i', '<M-CR>'},
    --                 MkdnTableNewRowBelow = {'n', '<leader>ir'},
    --                 MkdnTableNewRowAbove = {'n', '<leader>iR'},
    --                 MkdnTableNewColAfter = {'n', '<leader>ic'},
    --                 MkdnTableNewColBefore = {'n', '<leader>iC'},
    --                 MkdnFoldSection = {'n', '<leader>f'},
    --                 MkdnUnfoldSection = {'n', '<leader>F'}
    --             }
    --         }) 
    --     end
    --     },

--     { "vimwiki/vimwiki",
--         branch = "dev",
-- },

    -- { "vimwiki/vimwiki",
    --     branch = "dev",
    --     init = function()
    --         vim.g.vimwiki_list = {
    --             {path = 'c:/Data/OneDrive/Note/Inbox', syntax = 'markdown', ext = '.md', auto_tags = 1},
    --             {path = 'c:/Data/OneDrive/Note/work', syntax = 'markdown', ext = '.md', auto_tags = 1},
    --             {path = 'c:/Data/OneDrive/Note/zk/Note', syntax = 'markdown', ext = '.md', auto_tags = 1},
    --             {path = 'c:/Data/OneDrive/Note/zk/Football', syntax = 'markdown', ext = '.md', auto_tags = 1},
    --             {path = 'c:/Data/OneDrive/Note/zk/Publish', syntax = 'markdown', ext = '.md', auto_tags = 1},
    --         }
    --         vim.g.vimwiki_filetypes = { 'markdown' }
    --         vim.g.vimwiki_list_ignore_newline = 0 -- for HTML hard line break export
    --         -- vim.g.vimwiki_conceallevel = 0
    --         -- vim.g.vimwiki_conceal_onechar_markers = 0
    --         vim.g.vimwiki_key_mappings = {table_mappings = 0}
    --     end,
    --     -- keys = {
    --     --     {"<C-Enter>", {"<Plug>VimwikiFollowLink", mode='n'}},
    --     --     {"<C-Enter>", {"<Plug>VimwikiFollowLink", mode='v'}},
    --     -- },
    -- },

-- {
--     'serenevoid/kiwi.nvim',
--     dependencies = {
--         "nvim-lua/plenary.nvim"
--     },
--     keys = {
--         { "<C-CR>", ":lua require(\"kiwi\").create_or_open_wiki_file()<cr>", desc = "Create or open wiki file" },
--         { "<leader>t", ":lua require(\"kiwi\").todo.toggle()<cr>", desc = "Toggle Markdown Task" }
--     },
--     lazy = true
-- },

    {
        "lervag/wiki.vim",
    },

    -- "chimay/organ",

    "hotoo/calendar-vim",

    -- { "mattn/calendar-vim",
    --     init = function()
    --         vim.g.calendar_diary_list = {
    --             {name = 'Diary', path = 'c:/Data/OneDrive/Note/Inbox/diary', ext = '.md'},
    --         }
    --     end,
    -- },
                
    -- { dir = "$VIM/plugin/calendar-vim" },


    -- 文件和缓冲区操作
    "chrisbra/vim-autosave",
    -- { dir = "$VIM/plugin/vim-autosave" },
    "lambdalisue/fern.vim",
    -- { dir = "$VIM/plugin/fern.vim" },
    "chimay/wheel",
    "lwflwf1/vim-session-manager",
    -- { dir = "$VIM/plugin/vim-session-manager" },
    "moll/vim-bbye",
    -- { dir = "$VIM/plugin/Bclose" },
    "ap/vim-buftabline",
    -- { dir = "$VIM/plugin/vim-buftabline",
    --   lazy = false,
    -- },
    "drmikehenry/vim-fontsize",
    -- { dir = "$VIM/plugin/vim-fontsize" },
    "mbbill/undotree",
    -- { dir = "$VIM/plugin/undotree" },
    "vim-scripts/FavEx",
    -- "yegappan/mru",
    "el-iot/buffer-tree",

    -- 配色和外观
    { "joshdick/onedark.vim",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1500, -- make sure to load this before all the other start plugins
      config = function()
          -- load the colorscheme here
          vim.cmd([[colorscheme onedark]])
      end,
    },
    { "sunuslee/vim-plugin-random-colorscheme-picker",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 2000, -- make sure to load this before all the other start plugins
    },
    -- "sunuslee/vim-plugin-random-colorscheme-picker",
    -- "vim-scripts/changeColorScheme.vim",
    -- { dir = "$VIM/plugin/changeColorScheme" },
    -- "dracula/dracula-theme",
    -- { dir = "$VIM/plugin/dracula" },
    "rakr/vim-one",
    -- { dir = "$VIM/plugin/vim-snazzy" },
    "ciaranm/inkpot",
    -- { dir = "$VIM/plugin/inkpot" },
    -- { dir = "$VIM/plugin/purify" },
    "sjl/badwolf",
    -- { dir = "$VIM/plugin/badwolf" },
    "NLKNguyen/papercolor-theme",
    -- { dir = "$VIM/plugin/papercolor-theme" },
    { dir = "$VIM/plugin/base16-vim" },
    { dir = "$VIM/plugin/one-half" },
    "sts10/vim-pink-moon",
    -- { dir = "$VIM/plugin/vim-pink-moon" },
    "nordtheme/vim",
    -- { dir = "$VIM/plugin/nord-vim" },
    "altercation/vim-colors-solarized",
    -- { dir = "$VIM/plugin/vim-colors-solarized" },
    "ghifarit53/tokyonight-vim",
    -- { dir = "$VIM/plugin/tokyonight-vim" },
    "KeitaNakamura/neodark.vim",
    -- { dir = "$VIM/plugin/neodark.vim" },
    "junegunn/limelight.vim",
    -- { dir = "$VIM/plugin/limelight.vim" },
    -- { dir = "$VIM/plugin/lightline" },

    "lilydjwg/colorizer",
    -- { dir = "$VIM/plugin/colorizer" },
    "calon/txt",
    -- { dir = "$VIM/plugin/txt" },
    "luochen1990/rainbow",
    -- { dir = "$VIM/plugin/rainbow" },

    -- 输入法
    -- "zhaosheng-pan/vim-im-select",
    -- { dir = "$VIM/plugin/vim-im-select" },

    "coderifous/textobj-word-column.vim",
    -- { dir = "$VIM/plugin/textobj-word-column" },

    -- 标签
    "liuchengxu/vista.vim",
    -- { dir = "$VIM/plugin/tagbar" },

    -- 窗口
    "calon/SimSoftWrap",
    -- { dir = "$VIM/plugin/SimSoftWrap" },
    -- "chrisbra/NrrwRgn",
    -- { dir = "$VIM/plugin/NrrwRgn" },

    -- 文件类型
    "aklt/plantuml-syntax",
    -- { dir = "$VIM/plugin/PlantUML" },
    "wpug/vim-lang-html",
    -- { dir = "$VIM/plugin/html" },
    "preservim/vim-markdown",
    -- { dir = "$VIM/plugin/vim-markdown" },

    -- 标记
    "jrosiek/vim-mark",
})

