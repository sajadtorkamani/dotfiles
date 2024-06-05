def clone_vim_packages
  repo_urls.each do |repo_url|
    repo_name = repo_url.split('/').last
    dest = "#{ROOT_PATH}/.vim/pack/plugins/start/#{repo_name}"

    if File.exist?(dest)
      puts "Skipping: #{dest} already exists"
    else
      `git clone #{repo_url} #{dest}`
      puts "Cloned: #{repo_name} to #{dest}"
    end
  end
end

def repo_urls
  [
    'https://github.com/jiangmiao/auto-pairs',
    'https://github.com/ctrlpvim/ctrlp.vim',
    'https://github.com/preservim/nerdtree',
    'https://github.com/vim-airline/vim-airline',
    'https://github.com/prettier/vim-prettier',
    'https://github.com/vim-syntastic/syntastic'
  ]
end

clone_vim_packages