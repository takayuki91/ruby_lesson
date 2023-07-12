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
b[4] = 50 #間はnil
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

# 4.3.3 配列の要素を削除する条件を自由に指定する
a = [1, 2, 3, 1, 2, 3]
a.delete(2) #deleteメソッド=>指定した値に一致する要素を削除
puts a

b = [1, 2, 3, 1, 2, 3]
b.delete_if do |n| #ndelete_ifメソッド
  n.even? # nが偶数なら実行
end
puts b