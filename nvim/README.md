Clone repo

install vim plug

install packer if you want to include metals
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

3. Install a [nerdfont](https://github.com/ryanoasis/nerd-fonts) and configure your terminal to use it (otherwise icons will not display correctly)

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

3.5. Install ripgrep for faster telescope plugin search
$ brew install ripgrep

4. Install plugins: 

   ```shell
   nvim '+PlugInstall | qa'
   ```

   :PackerInstall

5. Start neovim: `nvim`
6. Install LSPs for the languages you care about via eg `:LspInstall python`.
   You can use tab completion after typing `:LspInstall ` to see which language
   servers are available

7. Add/customize your keybindings to `~/.config/nvim/init.vim`.


TODO:
 Migrate plug.vim to plugins.lua and remove plug dependency and use packer for everything
