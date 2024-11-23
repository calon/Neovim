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

-- vim.g.sqlite_clib_path = "C:\\Users\\Calon\\AppData\\Local\\nvim\\sqlite\\sqlite3.dll"

require("lazy").setup({

    -- 基础
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope.nvim",
        -- config = function()
        --     require('telescope').setup {
        --         defaults = {
        --             file_ingore_patterns = {
        --                 "firenvim"
        --             }
        --         }
        --     }
        -- end
    },

    { "nvim-telescope/telescope-frecency.nvim", tag = "0.1.4",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "skywind3000/vim-quickui",
    { "itchyny/lightline.vim",
        lazy = false,
        priority = 1000,
    },

    --历史文件
    { "echasnovski/mini.visits",
        version = "*",
        config = function() 
            require("mini.visits").setup()
        end
    },

    -- 补全
    { "neoclide/coc.nvim", branch = "release", },
    "skywind3000/vim-dict",

    -- 移动跳转
    { "phaazon/hop.nvim",
        config = function()
            require('hop').setup { keys = 'jetovxqpdygfblzhckisuranmw' }
            vim.keymap.set('n', 's', function()
                require('hop').hint_patterns({multi_windows = true}, '..')
            end, {remap=true})
        end
    },
    "chaoren/vim-wordmotion",
    "zzhirong/vim-easymotion-zh",
    "easymotion/vim-easymotion",
    "joeytwiddle/sexy_scroller.vim",

    -- 外观
    "rcarriga/nvim-notify",
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",

    -- 快捷操作
    -- "KabbAmine/lazyList.vim",
    "tomtom/tcomment_vim",
    "junegunn/vim-easy-align",
    "Konfekt/FastFold",
    "chrisgrieser/nvim-origami",
    "calon/escape_search",
    "vim-scripts/create_start_fold_marker.vim",
    "calon/quicksave",
    "tpope/vim-repeat",
    "vim-scripts/SearchComplete",

    -- 文本处理
    "dhruvasagar/vim-table-mode",
    "dkarter/bullets.vim",
    "hotoo/pangu.vim",
    "machakann/vim-sandwich",
    "ralismark/opsort.vim",
    "godlygeek/tabular",

    -- 笔记
    "calon/VOoM",
    "lervag/wiki.vim",
    "hotoo/calendar-vim",

    -- 文件和缓冲区操作
    "chrisbra/vim-autosave",
    "psych3r/vim-remembers",
    "lambdalisue/fern.vim",
    "chimay/wheel",
    "lwflwf1/vim-session-manager",
    "moll/vim-bbye",
    "ap/vim-buftabline",
    "drmikehenry/vim-fontsize",
    "mbbill/undotree",
    "vim-scripts/FavEx",
    "AndrewRadev/simple_bookmarks.vim",
    { "crusj/bookmarks.nvim",
        -- keys = {
        --     { "<Leader><Leader>", mode = { "n" } },
        -- },
        branch = "main",
        dependencies = { "nvim-web-devicons" },
        config = function()
            require("bookmarks").setup(
                {
                    keymap = {
                        toggle = "<Space>m", -- Toggle bookmarks(global keymap)
                        -- add = "\\z", -- Add bookmarks(global keymap)
                        -- jump = "<CR>", -- Jump from bookmarks(buf keymap)
                        -- delete = "dd", -- Delete bookmarks(buf keymap)
                        -- order = "<space><space>", -- Order bookmarks by frequency or updated_time(buf keymap)
                        -- delete_on_virt = "\\dd", -- Delete bookmark at virt text line(global keymap)
                        -- show_desc = "\\sd", -- show bookmark desc(global keymap)
                    },
                }
            )
            require("telescope").load_extension("bookmarks")
        end
    },
    -- "el-iot/buffer-tree",

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
    "rakr/vim-one",
    "ciaranm/inkpot",
    "sjl/badwolf",
    "NLKNguyen/papercolor-theme",
    { dir = "$VIM/plugin/base16-vim" },
    { dir = "$VIM/plugin/one-half" },
    "sts10/vim-pink-moon",
    "nordtheme/vim",
    "altercation/vim-colors-solarized",
    "ghifarit53/tokyonight-vim",
    "KeitaNakamura/neodark.vim",
    "junegunn/limelight.vim",

    "lilydjwg/colorizer",
    "calon/txt",
    "luochen1990/rainbow",

    -- 缩进
    -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- 文本对象
    "coderifous/textobj-word-column.vim",
    "wellle/targets.vim",

    -- 标签
    "liuchengxu/vista.vim",

    -- 窗口
    "calon/SimSoftWrap",
    { "nvim-focus/focus.nvim",
        version = "*",
        config = function() 
            require("focus").setup()
        end
    },

    --折叠
    -- "kevinhwang91/nvim-ufo",

    -- 文件类型
    "aklt/plantuml-syntax",
    "wpug/vim-lang-html",
    "preservim/vim-markdown",
    "freitass/todo.txt-vim",

    -- 自定义彩色标记
    "jrosiek/vim-mark",
    "bpstahlman/txtfmt",

    -- 首页
    { "echasnovski/mini.starter",
        version = "*",
        config = function() 
            require("mini.starter").setup()
        end
    },

    -- 浏览器协同
    -- "subnut/nvim-ghost.nvim",
    -- {
    --     "glacambre/firenvim",
    --     -- Lazy load firenvim
    --     -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    --     lazy = not vim.g.started_by_firenvim,
    --     build = function()
    --         vim.fn["firenvim#install"](0)
    --     end
    -- },
})

