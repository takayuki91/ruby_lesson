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
# 4.4.2 select/find_all/reject要素のみ集める
# => ブロックの戻り値が真（偽）の

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