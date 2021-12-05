  require './player'

    numbers_math = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
    ]

    def run_game

      player = Player.new
      computer = Computer.new
      numbers = "1  2  3\n4  5  6\n7  8  9"
      numbers_cp = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      while true do
        puts "数字のマスを選んでください[1〜9]"
        s = gets.chomp.to_s
        if numbers_cp.include?(s)
          if s == "1" || s == "2" || s == "3" || s == "4" || s == "5"|| s == "6" || s == "7" || s == "8" || s == "9"
            numbers.gsub!("#{s}", "○")
            player.player_number << s
            numbers_cp.delete(s)
            puts numbers
            marubatu_judge(player, computer)
          else
            puts "無効な値です。もう一度入力してください。"
          end

          c = numbers_cp.sample
          puts "computerは#{c}を選びました"
          numbers.gsub!("#{c}", "×")
          computer.computer_number << c
          numbers_cp.delete(c)
          puts numbers
          marubatu_judge(player, computer)

        else
          puts "無効な値です。もう一度入力してください。"
        end
      end
    end
    
      #勝敗判定
      def marubatu_judge(player, computer)
        x = player.player_number
        y = computer.computer_number
        if x.include?("1") && x.include?("2") && x.include?("3") || x.include?("4") && x.include?("5") && x.include?("6") || x.include?("7") && x.include?("8") && x.include?("9") || x.include?("1") && x.include?("4") && x.include?("7") || x.include?("2") && x.include?("5") && x.include?("8") || x.include?("3") && x.include?("6") && x.include?("9") || x.include?("1") && x.include?("5") && x.include?("9") || x.include?("3") && x.include?("5") && x.include?("7")
          puts "あなたの勝ちです"
          exit
        elsif y.include?("1") && y.include?("2") && y.include?("3") || y.include?("4") && y.include?("5") && y.include?("6") || y.include?("7") && y.include?("8") && y.include?("9") || y.include?("1") && y.include?("4") && y.include?("7") || y.include?("2") && y.include?("5") && y.include?("8") || y.include?("3") && y.include?("6") && y.include?("9") || y.include?("1") && y.include?("5") && y.include?("9") || y.include?("3") && y.include?("5") && y.include?("7")
          puts "あなたの負けです"
          exit
        else
          return
        end
      end


    puts "丸ばつゲームのスタートです"
    numbers_math.each do |left, middle, right|
      puts "[#{left}, #{middle}, #{right}]"
    end
    puts run_game

