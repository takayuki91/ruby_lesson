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



puts "==============="
#  練習

text = <<TEXT
名前：山田太郎
電話：06-2222-2222
住所：418-0011 富士山頂
TEXT
puts text.scan /\d\d-\d\d\d\d-\d\d\d\d/

puts "---------------"

text = <<TEXT
名前：山田太郎
電話：06-2222-2222
電話：090-2222-2222
電話：0120-2222-2222
電話：22222-2-2222
住所：418-0011 富士山頂
TEXT
puts text.scan /\d{2,5}-\d{1,4}-\d{4}/

puts "---------------"

text = <<TEXT
名前：山田太郎
電話：06(2222)2222
電話：090-2222-2222
電話：0120(22)2222
電話：22222-2-2222
住所：418-0011 富士山頂
TEXT

puts text.scan /\d{2,5}[-(]\d{1,4}[-)]\d{4}/



puts "---------------"
#  6.3.5 正規表現と組み合わせると便利なStringクラスのメソッド

# scan
# 引数で渡した正規表現にマッチする部分を配列に入れて返す
puts "123 456 789".scan(/\d+/)
# 正規表現に()があると、キャプチャされた部分が配列の配列になる
puts "1555年5月15日 2023年7月20日".scan(/(\d+)年(\d+)月(\d+)日/)
# グループ化はしたいが、キャプチャはしたくない
puts "1555年5月15日 2023年7月20日".scan(/(?:\d+)年(?:\d+)月(?:\d+)日/)

puts "1555年5月15日 2023年7月20日".scan(/\d+年\d+月\d+日/)

# [], slice, slice!
# []に正規表現を渡すと、文字列から正規表現にマッチした文字列が返る
text = "郵便番号は123-4567です"
puts text[/\d{3}-\d{4}/]

# 複数ある場合は、最初にマッチしたものが返る
text = "郵便番号は123-4567です。　郵便番号は765-4321です。"
puts text[/\d{3}-\d{4}/]

# キャプチャを使うと第2引数で指定できる
text = "1555年5月15日"
puts text[/(\d+)年(\d+)月(\d+)日/]
puts text[/(\d+)年(\d+)月(\d+)日/, 3]

# 名前つきキャプチャであれば、名前で指定できる
text = "誕生日は1555年5月15日です"

puts text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, :day]
puts text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, :month]
puts text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, :year]

# sliceは[]のエイリアスメソッド

text = "郵便番号は123-4567です"
puts text.slice(/\d{3}-\d{4}/)

# slice!は破壊的に取り除かれる

text = "郵便番号は123-4567です"
text.slice!(/\d{3}-\d{4}/)
puts text

puts "---------------"
# split
# マッチした文字を区切り文字にして文字列を分解し、配列として返す

text = "123,456-789"
puts text.split(",")
puts text.split(/[,-]/)

numbers = "3316767188980809812234"
puts numbers.split(/[10]/)

tanuki = "ルたビたーたをたがたんたばる"
puts tanuki.split(/[た]/)

# gsub gsub!
# gsubメソッドを使うと、第1引数の正規表現にマッチした文字列を第2引数の文字列で置き換える

text = "123,456-789"
puts text.gsub(",", "-")
puts text.gsub(/[,-]/, ":")
puts text.gsub(/,|-/, ":")

puts "---------------"
# 第二引数にハッシュを渡して、変換のルールを指定

text = "123,456-789"
hash = { "," => ":", "-" => "/" }
puts text.gsub(/,|-/, hash)
puts text.gsub(/[,-]/, hash)

puts "==============="
text = "ABC"
puts text.match(/[AB]/) #文字クラス
puts text.match(/A|B/)  #正規表現の論理的な「または」

text2 ="BCD"
puts text2.match(/[AB]/) #文字クラス
puts text2.match(/A|B/)  #正規表現の論理的な「または」

puts "==============="

text = "123,456-789"
puts text.gsub(/,|-/) { |matched| matched == "," ? ":" : "/"}
puts text

# gsub!は破壊的
text = "123,456-789"
puts text.gsub!(/,|-/) { |matched| matched == "," ? ":" : "/"}
puts text

puts "---------------"
# gsubはキャプチャと組み合わせて文字列を置換できる

text = "誕生日は1955年3月17日です"
puts text.gsub(/(\d+)年(\d+)月(\d+)日/, '\1-\2-\3')

# "ダブル"なら、エスケープが必要
puts text.gsub(/(\d+)年(\d+)月(\d+)日/, "\\1-\\2-\\3")

# ブロックを使うと、簡潔になる
text.gsub(/(\d+)年(\d+)月(\d+)日/) do
  puts "#{$1}-#{$2}-#{$3}" #組み込み変数
end

# 名前付きキャプチャを使う

text = "誕生日は1955年3月17日です"
text.gsub(/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/) do
  puts "#{$~[:year]}-#{$~[:month]}-#{$~[:day]}"
end