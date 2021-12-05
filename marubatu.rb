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
      end
    end
      #勝敗判定
      def marubatu_judge(player, computer)
        xp = player.player_number
        yc = computer.computer_number
        if xp == ["1", "2", "3"] || xp == ["4", "5", "6"] || xp == ["7", "8", "9"] || xp == ["1", "4", "7"] || xp == ["2", "5", "8"] || xp == ["3", "6", "9"] || xp == ["1", "5", "9"] || xp == ["3", "5", "7"]
          puts "あなたの勝ちです"
          exit
        elsif yc == ["1", "2", "3"] || yc == ["4", "5", "6"] || yc == ["7", "8", "9"] || yc == ["1", "4", "7"] || yc == ["2", "5", "8"] || yc == ["3", "6", "9"] || yc == ["1", "5", "9"] || yc == ["3", "5", "7"]
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

