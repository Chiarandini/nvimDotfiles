# 🚀 My Neovim Configuration

A Neovim configuration built with Lua and the [Lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager. This is my personal setup that focuses my text-editing needs which primarily includes latex, markdown, lua, python, and a few other programming languages I occasionally use.
## ✨ Features

<!-- - **📝 Multi-language Support**: Enhanced support for LaTeX, Markdown, Python, Lua, and more -->
- **Search & Navigation**: Telescope/snack-picker integration with fuzzy finding, project search, and file navigation
- **Advanced LSP**: Full Language Server Protocol integration with auto-completion, diagnostics, and code actions
- **Custom UI**: Custom statusline, tabline, and colorscheme, including toggle-able animations.
- **Academic Writing**: Comprehensive LaTeX support with VimTeX, custom snippets, and PDF compilation
- **Developer Tools**: Integrated debugging, terminal, git workflow, and project management
- **Performance Optimized**: Fast startup with lazy loading and disabled unnecessary providers

## 🗂️ Configuration Structure

```
nvim/
├── lua/
│   ├── configs/         # Plugin configuration files
│   ├── plugins/         # Plugin installation and setup (Lazy.nvim specs)
│   ├── settings/        # Core Neovim settings, keymaps, and autocommands
│   ├── sources/         # Custom completion sources
│   └── utils/           # Helper functions and utilities
├── LuaSnip/            # Custom LuaSnip snippets (Lua-based, not VSCode format)
├── ftplugin/           # Filetype-specific configurations
├── preamble/           # LaTeX preamble templates and chunks
├── queries/            # Custom Tree-sitter queries
├── spell/              # Custom dictionary words for spellchecker
└── session/            # Session management files (auto-generated)
```

## ⌨️ Key Concepts

### Leader Keys
- `\` - **Main Leader**: Actions and commands
- `<Space>` - **Navigation Leader**: Search, find, and navigation
- `,` - **Local Leader**: Filetype-specific actions (LaTeX, Markdown, debugging, etc.)

### Core Principles
- `q` closes windows where macro recording isn't needed
- `<Esc>` dismisses notifications and clears search highlighting
- WhichKey provides contextual help with 1.5s delay
- `;` is remapped to `:`.
- Extensive use of toggle mappings via ``[/]`` and ``']o'/']o'`` for quick option changes

## 📊 Statusline Features

The statusline displays comprehensive information:
- **LSP Status**: Active language server with color coding
- **Git Integration**: Current branch and change indicators
- **LaTeX Compilation**: Document size and compilation progress/status
- **File Information**: Name and optional path from project root
- **Macro Recording**: Shows `q<key>` when recording
- **Debug Information**: Active debugging session details

## ⌨️ Keyboard Shortcuts

### Main Leader (`\`) - Actions
| Key | Action |
|-----|--------|
| `r` | Refactor code |
| `R` | Run/execute |
| `b` | Box text formatting |
| `d` | Debug operations |
| `o` | Obsidian integration |
| `f` | Format code |
| `h` | Git hunk operations |
| `S` | Spotify controls |
| `s` | Case conversion (camelCase/snake_case) |
| `t` | Toggle windows |

### Navigation/Pairs (`[` and `]`)
| Key | Action |
|-----|--------|
| `s` | Previous/next misspelled word |
| `b` | Previous/next buffer |
| `d` | Previous/next diagnostic |
| `e` | Swap lines up/down |
| `<Space>` | Add blank line above/below |
| `h` | Previous/next git hunk |
| `j` | Join/unjoin lines |
| `m`/`M` | Method start/end |
| `[`/`]` | Block or heading navigation |
| `t` | Previous/next TODO comment |
| `z` | Previous/next fold |

### Option Toggles (`[o`/`]o`)
| Key | Toggle |
|-----|--------|
| `a` | Auto-chdir |
| `b` | Light/dark background |
| `B` | Code block visualization |
| `c` | Cursorline |
| `d` | Diff mode |
| `h` | Search highlighting |
| `I` | Illuminate plugin |
| `i` | Ignore case |
| `l` | Show trailing characters |
| `L` | LSP start/stop |
| `s` | Spell checking |
| `S` | Scroll binding |
| `T` | Tree-sitter |
| `u` | Cursor column |
| `v` | Virtual edit |
| `w` | Line wrapping |
| `W` | Window animations |
| `x` | Cursor crosshair |

### Window Management (`<C-w>`)
| Key | Action |
|-----|--------|
| `<C-g>` | LazyGit |
| `<C-o>` | Oil file manager |
| `<C-r>` | Multi-replace |
| `<C-s>` | Spectre search/replace |
| `<C-t>` | open terminal |
| `<C-u>` | Undo tree |
| `<C-m>` | Mason package manager |
| `<C-l>` | LSP info |
| `<c-e>` | File explorer toggle |
| `d` | Debug UI |
| `h` | Harpoon |
| `o` | Outline/symbols |
| `l` | Lazy plugin manager |

<!-- | `t` | erminal toggle | -->
### Navigation Leader (`<Space>`) - Search & Find
| Key | Action |
|-----|--------|
| `/` | Fuzzy search in current file |
| `<Space>` | Browse current directory |
| `C` | Select colorscheme |
| `P` | Plugin management |
| `q` | Quickfix list (Trouble) |
| `r` | Resume last Telescope search |
| `T` | Terminal selector |
| `t` | Table of contents |
| `d` | Diagnostics menu |
| `D` | Debug menu |
| `e` | Editor files |
| `g` | Grep/search |
| `l` | LSP menu |
| `w` | Wiki/notes |
| `f` | Find submenu |
| `c` | Config submenu |

### Find Submenu (`<Space>f`)
| Key | Action |
|-----|--------|
| `B` | Bookmarks |
| `b` | Open buffers |
| `c` | Available commands |
| `f` | Files in current directory |
| `G` | Git changes |
| `h` | Help documentation |
| `k` | Keymaps |
| `m` | Marks |
| `n` | Notifications |
| `o` | Recent files |
| `p` | Project files |
| `t` | TODO comments |
| `u` | Undo history |

### Config Submenu (`<Space>c`)
| Key | Action |
|-----|--------|
| `c` | Neovim config files |
| `C` | All config files |
| `f` | Ftplugin files |
| `p` | Plugin configurations |
| `P` | LaTeX preambles |
| `s` | Snippets |

### Other Important Bindings
| Key | Action | Mode |
|-----|--------|------|
| `\|` | Temporary vertical split | Normal |
| `+` | Edit in new tab | Normal |
| `_` | Temporary horizontal split | Normal |
| `J`/`K` | Move up/down keeping cursor position | Normal |
| `L` | LSP hover | Normal |
| `;` | Command mode (`:`) | Normal |
| `U` | Redo | Normal |
| `<C-t>` | Buffer file stack navigation | Normal |
| `<C-s>` | Show file in tree | Normal |
| `<C-/>` | Toggle comment | Normal |
| `<C-;>` | Open terminal | Normal |
| `>>`/`<<` | Move function parameters | Normal |
| `<C-l>` | Auto-fix spelling | Insert |
| `T` | Tabularize selection | Visual |
| `c` | Search/replace selection | Visual |

## 🔌 Key Plugins

### Core Functionality
- **[Lazy.nvim](https://github.com/folke/lazy.nvim)**: Plugin manager with lazy loading
- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)**: Fuzzy finder and search interface
- **[WhichKey](https://github.com/folke/which-key.nvim)**: Contextual keybinding help
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: Snippet engine with custom Lua snippets

### Language Support
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Language Server Protocol integration
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Syntax highlighting and parsing
- **[VimTeX](https://github.com/lervag/vimtex)**: Comprehensive LaTeX support
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** / **[blink.cmp](https://github.com/saghen/blink.cmp)**: Auto-completion engines

### UI & Visual Enhancements
- **[Heirline](https://github.com/rebelot/heirline.nvim)**: Custom statusline configuration
- **[Alpha](https://github.com/goolord/alpha-nvim)**: Customizable start screen
- **[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)**: File explorer sidebar
- **[Noice](https://github.com/folke/noice.nvim)**: Enhanced UI for messages and notifications

### Development Tools
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)**: Debug Adapter Protocol integration
- **[Gitsigns](https://github.com/lewis6991/gitsigns.nvim)**: Git integration with line-level changes
- **[LazyGit](https://github.com/kdheepak/lazygit.nvim)**: Terminal-based Git UI
- **[Trouble](https://github.com/folke/trouble.nvim)**: Enhanced diagnostics and quickfix list

### Writing & Productivity
- **[Obsidian](https://github.com/epwalsh/obsidian.nvim)**: Note-taking and knowledge management
- **[Neorg](https://github.com/nvim-neorg/neorg)**: Organized note-taking and task management
- **[Comment](https://github.com/numToStr/Comment.nvim)**: Smart code commenting
- **[Flash](https://github.com/folke/flash.nvim)**: Enhanced navigation and jumping (optional, disabled by default)

## 🚀 Installation

### Prerequisites
- **Neovim 0.10+** (latest stable recommended)
- **Git** for plugin management
- **Node.js** for LSP servers and tools
- **Python 3** with `pynvim` for Python integration
- **LaTeX distribution** (for LaTeX support)
- **Ripgrep** for faster searching
- **A Nerd Font** for icon support

### Quick Start
1. **Backup your existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```

4. **Install plugins**: Lazy.nvim will automatically install all plugins on first launch.

5. **Install LSP servers**: Use `:Mason` to install language servers for your languages.

### Post-Installation
- Review `lua/settings/options.lua` for personal preferences
- Customize colorschemes in `lua/plugins/colorschemes.lua`
- Add personal snippets to the `LuaSnip/` directory
- Configure LSP servers in `lua/configs/lsp.lua`

## ⚙️ Customization

### File-type Specific Features
- **LaTeX**: Custom snippets, compilation shortcuts, and preamble templates
- **Markdown**: Enhanced editing with live preview and table formatting
- **Python**: REPL integration with Iron.nvim and debugging setup
- **TypeScript/React**: Completion and refactoring tools

### Custom Sources & Utilities
- **Custom CMP Sources**: Located in `lua/sources/`
- **Helper Functions**: Utility functions in `lua/utils/`
- **LaTeX Preambles**: Template chunks in `preamble/`
- **Spell Checking**: Custom dictionary words in `spell/`

##  Local Leader Mappings

The local leader (`,`) provides filetype-specific functionality:

### LaTeX (`,`)
- Compilation and viewing commands
- Citation and reference tools
- Custom environment insertion

### Markdown (`,`)
- Table formatting and navigation
- Preview and export options
- Link management

### Debugging (`,`)
- Breakpoint management
- Step execution controls
- Variable inspection

### Neorg (`,`)
- Task management
- Journal entries
- Note linking and organization

## 🎯 Philosophy

This configuration prioritizes:
- **Efficiency**: Minimal keystrokes for common operations
- **Consistency**: Logical keybinding patterns across contexts
- **Performance**: Fast startup and responsive editing
- **Academic Workflow**: Strong support for LaTeX and research writing
- **Extensibility**: Easy customization and plugin integration

## 📚 Learning Resources

- **WhichKey Help**: Press any leader key and wait 1.5s for contextual help
- **Telescope Commands**: `<Space>fk` to browse all keymaps
- **Plugin Documentation**: `:help <plugin-name>` for specific plugins

## ⚠️ Requirements & Assumptions

This configuration assumes familiarity with:
- Vim/Neovim concepts (modes, buffers, windows, tabs)
- Basic Lua scripting
- Command-line tools and development workflows
- LaTeX for academic writing features

**Note**: This is a personal configuration optimized for specific workflows. While comprehensive, it may require customization for your specific needs.
