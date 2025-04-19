# WSL ArchLinux用dotfiles

WSL上のArchLinuxで使用しているドットファイル

## セットアップ

1. ArchLinuxをインストールする

   ```shell
   $ wsl --install archlinux
   ```

1. ArchLinuxを実行

   ```shell
   $ wsl --distribution archlinux
   ```

1. パッケージを最新にアップグレードする。

   ```shell
   # pacman -Syu
   ```

1. `base-devel`, `curl`, `neovim`パッケージをインストールする。

   ```shell
   # pacman -S base-devel curl neovim
   ```

1. `visudo`で設定ファイルを開き、`wheel`グループに対するsudo権限を付与する。

   ```shell
   # EDITOR=nvim visudo
   ```

   ```txt
   %wheel ALL=(ALL) ALL
   ```

1. 一般ユーザを作成する。

   ```shell
   # useradd --groups wheel --create-home [ユーザ名]
   ```

1. 一般ユーザーでログインする。

   ```shell
   # su - [ユーザー名]
   ```

1. dotfilesリポジトリをクローンする

   ```shell
   $ git clone https://github.com/ko-maru/dotfiles-wsl-archlinux.git ~/dotfiles
   ```

1. `make`を実行し、セットアップを行う

   ```shell
   $ make
   ```
