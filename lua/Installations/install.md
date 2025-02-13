# go

wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc

<!-- TODO: resource-->

go version

# Neovim latest

LAZYGIT*VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]_')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}\_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# fd-find and ripgrep

sudo nala update && sudo nala install ripgrep fd-find findutils -y

# fint fi installed

which eslint_d
which prettier
which typescript-language-server

 <!--eslint_d not found-->
 <!--prettier not found-->
 <!--typescript-language-server not found-->

# pnpm

pnpm add -g @tailwindcss/language-server
pnpm add -g eslint eslint_d prettier typescript typescript-language-server
pnpm add -g vscode-langservers-extracted
pnpm add -g @fsouza/prettierd

pnpm bin -g <!-- Y: This will output something like: -->
/home/your-username/.pnpm-store/global/bin

<!-- Y: Add the directory to your $PATH in your shell configuration file (~/.bashrc, ~/.zshrc, etc.):-->

export PATH=$PATH:$(pnpm bin -g)
