puts "---------------"
#  6.2 正規表現

#  6.2.1 正規表現の便利さを知る
text = <<TEXT
I love Ruby.
Python is a great language.
Java and JavaScript are different.
TEXT

puts text
puts text.scan(/[A-Z][A-Za-z]+/)

text = <<TEXT
私の郵便番号は1234567です。
僕の住所は9876543 東京都1234です。
TEXT

puts text
puts text.gsub(/(\d{3})(\d{4})/) { "#{$1}-#{$2}"}

puts "---------------"
#  6.2.3 Rubyにおける正規表現オブジェクト

# 正規表現

r = /\d{3}-\d{4}/
puts r.class

# 文字列と正規表現のマッチ
puts "123-4567" =~ /\d{3}-\d{4}/
puts "apple" =~ /\d{3}-\d{4}/

# if文
if "123-4567" =~ /\d{3}-\d{4}/
  puts "マッチしました"
else
  puts "マッチしませんでした"
end

# マッチしなかったとき
puts "123-4567" !~ /\d{3}-\d{4}/
puts "apple" !~ /\d{3}-\d{4}/

puts "---------------"
#  6.3.2 正規表現のキャプチャを利用する
text = "私の誕生日は1585年7月17日です。"
m = /(\d+)年(\d+)月(\d+)日/.match(text)
puts m[1]
puts m[2]
puts m[3]

puts /(\d+)年(\d+)月(\d+)日/.match(text)
puts /(\d+)年(\d+)月(\d+)日/.match("foobar")

puts "---------------"
# 条件分岐の中で真偽値の判定とローカル変数への代入を同時にやってしまう
text = "私の誕生日は1585年7月17日です。"
if m = /(\d+)年(\d+)月(\d+)日/.match(text)
  puts "マッチしたよ"
else
  puts "マッチしなかったよ"
end

# 配列を使う
text = "私の誕生日は1585年7月17日です。"
m = /(\d+)年(\d+)月(\d+)日/.match(text)

puts m[0]
puts m[1]
puts m[2, 2]
puts m[-1]
puts m[1..3]

# matchメソッドはStringクラスにもRegexpクラスにもある
text = "私の誕生日は1585年7月17日です。"
puts m = text.match(/(\d+)年(\d+)月(\d+)日/)

puts "---------------"
#  6.3.3 キャプチャに名前をつける
# (?<year>\d+)年(?<month>\d+)月(?<day>\d+)日

text = "私の誕生日は1585年7月17日です。"
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)

# シンボルで
puts m[:year]
puts m[:month]
puts m[:day]

# 文字列も可能
puts m["year"]
puts m["month"]
puts m["day"]

# キャプチャの名前をローカル変数に割り当てる
# 正規表現リテラルを直接左辺に置く必要がある
text = "私の誕生日は1585年7月17日です。"
if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
  puts "#{year}/#{month}/#{day}"
end

puts "---------------"
#  6.3.4 組み込み変数でマッチの結果を取得する

text = "私の誕生日は1585年7月17日です。"

# 代入
text =~ /(\d+)年(\d+)月(\d+)日/

# オブジェクト取得
puts $~
puts $&

puts $1
puts $2
puts $3
puts $+