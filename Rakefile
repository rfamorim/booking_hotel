namespace :insert_search do
  task :from_a_file do
    puts "\nPor favor, insira abaixo o caminho(path) do documento a ser lido com as buscas desejadas:"

    path = STDIN.gets.chomp

    unless path.strip.empty?
      require_relative 'search_file'

      SearchFile.new(file_path: path)

    else
      puts "Não é possível ler um arquivo em branco. Tente novamente."
    end

    puts "\nRealizar outra busca? [S/N]"

    answer = STDIN.gets.chomp
    
    if answer == "S" or answer == "s"
      puts "Sim"
      Rake::Task["insert_search:from_a_file"].execute

    elsif answer == "N" or answer == "n"
      puts "Não"
      puts "\nMuito obrigado pela sua busca. Até a próxima!\n"
    end
  end

  task :from_a_single_search do
    puts "\nPor favor, insira abaixo a busca desejada:"

    search = STDIN.gets.chomp

    unless search.strip.empty?
      require_relative 'booking_search'

      BookingSearch.new(search: search.strip)

    else
      puts "Não é possível realizar uma busca em branco. Tente novamente."
    end

    puts "\nRealizar outra busca? [S/N]"

    answer = STDIN.gets.chomp
    
    if answer == "S" or answer == "s"
      puts "Sim"
      Rake::Task["insert_search:from_a_single_search"].execute

    elsif answer == "N" or answer == "n"
      puts "Não"
      puts "\nMuito obrigado pela sua busca. Até a próxima!\n"
    end
  end
end