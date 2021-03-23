#!/usr/bin/env ruby
aliases_dir = File.join(__dir__, 'aliases')
aliases = Dir.entries(aliases_dir).select { |item| item.end_with? '.zsh' }

aliases.each do |file|
  src = File.join(aliases_dir, file)
  dest = File.join(Dir.home, '.oh-my-zsh', 'custom', file)

  if File.exist?(dest)
    puts "#{dest} already exists, skipping."
    next
  end

  system(`ln -s #{src} #{dest}`)
end
