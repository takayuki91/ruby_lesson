puts "Hello, World"

# 4.2 配列

puts [].class

a = [1, 2, 3]
puts a[0]
puts a[1]
puts a[2]
b = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts b[0]
puts b[1]
puts b[2]
puts b[3] #存在しないものはnil
puts a.size #sizeメソッド=>配列の長さを取得
puts b.length # エイリアスメソッドlength=>配列の長さを取得

puts "---------------"
# 4.2.1 要素の変更、追加、削除

a = [1, 2, 3]
a[1] = 20
puts a
b = [1, 2, 3]
b[4] = 50 #3番目はnil
puts b
c = [1, 2, 3]
c << 4 # 配列の最後に要素を追加
puts c

d = [1,2,3]
d.delete_at(1) #delete_atメソッド=>配列のn番目を削除
puts d

puts "---------------"
# 4.2.2 配列を使った多重代入

a, b = 1, 2
puts a
puts b

c, d = [1, 2]
puts c
puts d

puts 14.divmod(3) #わり算の商とあまりを配列で返す

quo_rem = 14.divmod(3)
e = "商 = #{quo_rem[0]}, あまり = #{quo_rem[1]}"
puts e

q, r = 14.divmod(3)
puts "商 = #{q}, あまり = #{r}"



puts "---------------"
# 4.3 ブロック
# => メソッドの引数として渡すことができる処理のかたまり

# 4.3.3 配列の要素を削除する条件を自由に指定する
a = [1, 2, 3, 1, 2, 3]
a.delete(2) #deleteメソッド=>指定した値に一致する要素を削除
puts a

b = [1, 2, 3, 1, 2, 3]
b.delete_if do |n| #ndelete_ifメソッド
  n.even? # nが偶数なら実行
end
puts b

puts "---------------"
# 4.3.4 ブロックパラメータとブロック内の変数
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |number|
  sum += number
end

puts sum

numbers.each do
  sum += 1
end

puts sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum_value = n.odd? ? n * 10 : n
  sum += sum_value
end

puts sum
# puts sum_value # ブロックの外ではnameerror

puts "---------------"
# 4.3.5 do…endと{}

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n| sum += n end
puts sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each { |n| sum += n } # do endの代わり
puts sum

# 改行を含む長いブロックを書く場合は、do end
# 1行でコンパクトに書く場合は{}



puts "---------------"
# 4.4 ブロックを使う配列のメソッド

# 4.4.1 map/collect
# => ブロックの戻り値が新しい配列の各要素になる

numbers = [1, 2, 3, 4, 5]
new_numbers = numbers.map { |n| n * 10 }
puts new_numbers

numbers = [1, 2, 3, 4, 5]
new_numbers = numbers.map do |n|
  n * 10
end
puts new_numbers

puts "---------------"
# 4.4.2 select/find_all/reject
# => ブロックの戻り値が真（偽）の要素のみ集める

numbers = [1, 2, 3, 4, 5, 6]
odd_numbers = numbers.select do |n| # selectはtrueを返す
  n.odd?
end
puts odd_numbers

even_numbers = numbers.reject do |n| # rejectはfalseを返す
  n.odd?
end
puts even_numbers

numbers = [1, 2, 3, 4, 5, 6]
nom_multiples_of_three = numbers.reject { |n| n % 3 == 0 }
puts nom_multiples_of_three

puts "---------------"
# 4.4.3 find/detect
# => ブロックの戻り値が最初に真になった要素を返す

numbers = [1, 2, 3, 4, 5, 6]
even_number = numbers.find { |n| n.even? }
puts even_number

puts "---------------"
# 4.4.4 sum
# => 要素の合計を求める

numbers = [1, 2, 3, 4, 5, 6]
puts numbers.sum

numbers = [1, 2, 3, 4]
puts numbers.sum { |n| n * 2 }

numbers = [1, 2, 3, 4, 5, 6]
puts numbers.sum(5) # 初期値に5を与える

chars = ["a", "b", "c"]
puts chars.sum("") #初期値を文字列にすることも可能

# join
# => 1つの文字列にする時
# to_sメソッド

chars = ["a", "b", "c"]
puts chars.join

chars = ["a", "b", "c"]
puts chars.join("-")

chars = ["a", "b", "c"]
puts chars.join("*")

chars = ["a", 2, "c"]
puts chars.join

chars = ["a", "b", "c"]
puts chars.sum(">") { |c| c.upcase } # upcaseは大文字に（小文字はdowncase）

puts "---------------"
# 4.4.5 &とシンボルを使ってもっと簡潔に書く

puts ["ruby", "java", "python"].map { |s| s.upcase }
puts ["ruby", "java", "python"].map(&:upcase)



puts "---------------"
# 4.5 範囲（Range）
# 範囲オブジェクトはRangeクラスのオブジェクト

puts (1..5).class # 1以上5以下
puts (1...5).class # 1以上5未満

a = 1..5
b = 1...5
puts a.include?(1)
puts a.include?(4.9)
puts a.include?(5)
puts b.include?(1)
puts b.include?(4.9)
puts b.include?(5)

puts "---------------"
# 4.5.1 配列や文字列の一部を抜き出す

a = [1, 2, 3, 4, 5]
puts a[0..3]

b = "abcdef"
puts b[0..2]

puts "---------------"
# 4.5.2 n以上m以下、n以上m未満の判定をする

def liquid?(temperature)
  0 <= temperature && temperature < 100
end

puts liquid?(-1)
puts liquid?(0)
puts liquid?(99)
puts liquid?(100)

def liquid?(temperature)
  (0...100).include?(temperature)
end

puts liquid?(-1)
puts liquid?(0)
puts liquid?(99)
puts liquid?(100)

puts "---------------"
# 4.5.3 case文で使う

def charge(age)
  case age
  when 0..5
    "¥0"
  when 6..12
    "¥300"
  when 13..18
    "¥600"
  else
    "¥1000"
  end
end

puts charge(5)
puts charge(10)
puts charge(16)
puts charge(33)

puts "---------------"
# 4.5.4 値が連続する配列を作成する

a = (1..5).to_a
b = (1...5).to_a
puts a
puts b

c = ("a".."e").to_a
d = ("a"..."e").to_a
puts c
puts d

c = [*"a".."e"] # ("a".."e").to_aと同じ
d = [*"a"..."e"] # ("a"..."e").to_aと同じ
puts c
puts d

puts "---------------"
# 4.5.5 繰り返し処理を行う

numbers = (1..4).to_a
sum = 0
numbers.each { |n| sum += n }
puts sum

sum = 0
(1..4).each { |n| sum += n }
puts sum

numbers = []
(1..10).step(3) { |n| numbers << n } # stepメソッド => 値を増やす間隔を指定
puts numbers

puts "---------------"
# 4.7.1 様々な要素の取得方法

# 配列[位置, 取得する長さ]

a = [1, 2, 3, 4, 5]
puts a[1, 3]

puts a[0]
puts a.values_at(0, 2, 4)

puts a[a.size - 1]

puts a[-1]

puts a.last

puts a.last(2)

puts "---------------"
# 4.7.2 様々なう要素の変更方法

a[-3] = 30
puts a

a = [1, 2, 3, 4, 5]

a[1, 3] = 100
puts a

a = []
a.push(1)
a.push(10, 100)
puts a

puts "---------------"
# 4.7.3 配列の結合

c = [1]
d = [2, 3]

puts c.concat(d)

array = [1]
other = [2, 3]

linking = array + other
puts linking
puts array
puts other

puts "---------------"
# 4.7.4 配列の和集合、差集合、積集合

a = ["カレー", "ラーメン", "寿司"]
b = ["ステーキ", "寿司", "パエリア"]

puts a | b

puts a - b

puts a & b

require "set"
# a = Set[1, 2, 3]
# b = Set[3, 4, 5]
a = Set["カレー", "ラーメン", "寿司"]
b = Set["ステーキ", "寿司", "パエリア"]
puts a | b
puts a - b
puts a & b

puts "---------------"
# 4.7.5 多重代入で残りの全要素を配列として受け取る

e, *f = 100, 200, 300
puts e
puts f

puts "---------------"
# 4.7.6 1つの配列を複数の引数やwhen節の条件として展開

a = []
b = ["ラーメン", "ギョウザ"]
a.push("チャーハン")
a.push(*b) # splat演算子
puts a

puts "---------------"
# 4.7.7 メソッドの可変長引数

def greet(*names)
  "#{names.join("と")}、こんにちは！"
end

puts greet("田中さん")
puts greet("田中さん", "須藤さん")

puts "---------------"
# 4.7.8 *で配列同士を非破壊的に連結する

a = [1, 2, 3]
puts [*a]

puts [-1, 0, *a, 4, 5]


puts "---------------"
# 4.7.9 ==で等しいかどうか判断

puts [1, 2, 3] == [1, 2, 3]

puts [1, 2, 3] == [1, 2]

puts "---------------"
# 4.7.10 %記法で文字列の配列を簡潔に作る

puts ["apple", "orange", "melon"]

puts %w!apple orange melon!
puts %w(apple orange melon)
puts %w!red\ apple orange\ orange green\ melon!

puts "---------------"
# 4.7.11 文字列を配列に変換

puts "Ruby".chars
puts "Ruby,Java,Python".split(",")

puts "---------------"
# 4.7.12 配列にデフォルト値を設定

puts a = Array.new(5)
puts a = Array.new(5, 0)

puts a = Array.new(10) { |n| n % 3 + 1 }

puts "---------------"
# 4.7.13 配列にデフォルト値を設定する場合の注意点

a = Array.new(5, "default")
puts a

str = a[0]
puts str

str.upcase!
puts str

puts a # a => DEFAULT * 5

b = Array.new(5) { "default"}
puts b

str = b[0]
puts str

str.upcase!
puts b # DEFAULT + default * 4



puts "---------------"
# 4.8 ブロックについてもっと詳しく
# 4.8.1 添え字付きの繰り返し処理

foods = ["ラーメン", "ギョウザ", "チャーハン"]
foods.each_with_index { |food, f| puts "#{f}: #{food}" }

puts "---------------"
# 4.8.2 with_indexメソッドを使った添え字付きの繰り返し処理

puts foods.map.with_index{ |food, f| "#{f}: #{food}" }

puts foods.delete_if.with_index{ |food, f| food.include?("メン") && f.even? }

puts "---------------"
# 4.8.3 添え字を0以外の数値から開始させる

foods = ["ラーメン", "ギョウザ", "チャーハン"]

foods.each.with_index(1) { |food, f| puts "#{f}: #{food}" }

puts foods.map.with_index(100){ |food, f| "#{f}: #{food}" }

puts "---------------"
# 4.8.4 配列がブロックパラメータに渡される場合

dimensions = [
    # [縦, 横]
    [10, 20],
    [30, 40],
    [50, 60],
  ]
    # 面積の計算結果を格納する配列
    areas = []
    # ブロックパラメータが1個であれば、ブロックパラメータの値が配列になる
    dimensions.each do |dimension|
      length = dimension[0]
      width = dimension[1]
      areas << length * width
    end

puts areas

# 492〜505を簡潔に
dimensions = [
    # [縦, 横]
    [10, 20],
    [30, 40],
    [50, 60],
  ]
    # 面積の計算結果を格納する配列
    areas = []
    # ブロックパラメータが1個であれば、ブロックパラメータの値が配列になる
    dimensions.each do |length, width|
      areas << length * width
    end

puts areas

puts "---------------"
# 位置情報も添える
dimensions = [
    [10, 20],
    [30, 40],
    [50, 60],
  ]
    dimensions.each_with_index do |(length, width), i |
      puts "length: #{length}, width: #{width}, i: #{i}"
    end

puts "---------------"
# 入れ子になった配列を変数に多重代入する

dimension, i = [[10, 20], 0]
puts dimension
puts i

(length, width), i = [[10, 20], 0]
puts length
puts width
puts i

puts "---------------"
# 4.8.5 番号指定パラメータ

# 番号指定パラメータを使わない場合
puts ["1", "20", "300"].map { |s| s.rjust(3, "0") }

# 番号指定パラメータを使う場合
puts  ["1", "20", "300"].map { _1.rjust(3, "0") }

# 番号指定パラメータを使わない場合
puts ["japan", "us", "italy"].map.with_index { |country, n| [n, country] }

# 番号指定パラメータを使う場合
puts ["japan", "us", "italy"].map.with_index { [_2, _1] }

puts "---------------"
# 4.8.6 ブロックローカル変数

numbers = [1, 2, 3, 4]
sum = 0

numbers.each do |n; sum|
  sum = 10
  sum += n
  puts sum
end

puts sum

puts "---------------"
# 4.8.8 do..endと{}の結合度の違い

a = [1, 2, 3]
puts a.delete(100)

a = [1, 2, 3]
puts a.delete(100) do
  "NG"
end