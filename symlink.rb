#!/usr/bin/env ruby
dotfiles = %w[.vimrc .zshrc]

dotfiles.each do |dotfile|
  src = File.join(__dir__, dotfile)
  dest = File.join(Dir.home, dotfile)

  if File.exist?(dest)
    puts "#{dest} already exists, skipping."
    next
  end

  system(`ln -s #{src} ~/#{dotfile}`)
end
