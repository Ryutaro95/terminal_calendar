
require 'date'

class Calendar
    def self.generate
        # 入力を受け取り年・月に代入
        input = gets.split.map(&:to_i)
        year = input[0]
        month = input[1]
    
        # 入力された年/月の始めと終わりの日にちを取得
        first_day = Date.new(year, month, 1)
        last_day = Date.new(year, month, -1)
        
        # 1日の曜日を取得
        first_day_week = first_day.wday # 1日の曜日番号取得 0 ~ 6
        
        # 年月日から日付を取得 2019-10-31 => 31
        first_day = first_day.day
        last_day = last_day.day
    
        # 1 ~ 31日までを配列に代入
        days = (first_day..last_day).map { |s| s.to_s }
        
        # 1日の曜日番号分先頭に空白を追加
        first_day_week.times do
            days = days.unshift('')
        end
        
        # 1. 文字幅を2文字にして右寄せ
        # 2. 配列を7つずつ分けてグループ化
        # 3. グループ毎、配列に代入
        # 4. 各グループ（配列）の末尾に改行コードを追加
        # 5. 配列を空白区切りで結合
        days = days.map { |r| r.rjust(2) }.each_slice(7).to_a.map { |arr| arr.push("\n") }.join(' ')
    end
    
    def self.output
        weeks = " Su Mo Tu We Th Fr Sa"
        puts weeks
        " #{Calendar.generate}"
    end
end

# print Calendar.output
p Calendar.generate