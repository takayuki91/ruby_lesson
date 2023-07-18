puts "---------------"
# 5.2 ハッシュ

# 空のハッシュ
a = {}
# キーとバリューの組み合わせ
# { キー1 => 値1, キー2 => 値2, キー3 => 値3 }

puts a.class

{ "japan" => "JPY", "us" => "dollar", "india" => "rupee" }

puts "---------------"
# 5.2.1 要素の追加、変更、取得
# ハッシュ[キー] = 値

currencies = { "japan" => "JPY", "us" => "dollar", "india" => "rupee" }

currencies["italy"] = "euro"

puts currencies

currencies["japan"] = "¥"

puts currencies

# ハッシュ[キー]でバリューを取り出す
puts currencies["us"]

puts "---------------"
# 5.2.2 ハッシュを使った繰り返し処理

currencies = { "japan" => "JPY", "us" => "dollar", "india" => "rupee" }

currencies.each do |key, value|
  puts "#{key}の通過は#{value}です"
end

# ブロックパラメータが1つならバリューが配列になる
currencies.each do |key_value|
  key = key_value[0]
  value = key_value[1]
  puts "#{key}の通過は#{value}です"
end

puts "---------------"
# 5.2.3 ハッシュの同値比較、要素数の取得、要素の削除

a = {"x" => 1, "y" => 2, "z" => 3}
b = {"x" => 1, "y" => 2, "z" => 3}
c = {"z" => 3, "y" => 2, "x" => 1}
puts a == b
puts a == c

puts a.size
a.delete("x")
puts a



puts "---------------"
# 5.3 シンボル
# :シンボルの名前
# 5.3.1 シンボルと文字列の違い

a = :japan
b = "japan"

puts a.class
puts b.class

# シンボルはRuby内部で整数として管理されるため、文字列よりも高速に処理できる

puts a.object_id
puts a.object_id
puts a.object_id

puts b.object_id
puts b.object_id
puts b.object_id

# シンボルはイミュータブルなので、破壊的変更不可

puts "---------------"
# 5.3.2  シンボルの特徴と主な用途

currencies = { :japan => "JPY", :us => "dollar", :india => "rupee" }
puts currencies[:japan]

status = :done
case status
when :todo
  puts "これからやります"
when :doing
  puts "今やっています"
when :done
  puts "すでにやり終えました"
end



puts "---------------"
# 5.4 続・ハッシュについて
# 5.4.1 ハッシュのキーにシンボルを使う

currencies = { :japan => "JPY", :us => "dollar", :india => "rupee" }
currencies[:italy] = "euro"
puts currencies

# 「シンボル: キー」で書き換える
currencies = { japan: "JPY", us: "dollar", india: "rupee" }
puts currencies[:japan]

# キーもバリューもシンボルで書き換える
currencies = { japan: :JPY, us: :dollar, india: :rupee }
puts currencies[:india]

puts "---------------"
# 5.4.2 キーや値に異なるデータ型を混在させる
person = {
  name: "Alice",
  age: 20,
  friends: ["Bob", "Carol"],
  phone: { home: "12345678", mobile: "09012345678" }
}

puts person[:name]
puts person[:age]
puts person[:friends]
puts person[:phone][:home]
puts person[:phone][:mobile]

puts "---------------"
# 5.4.3 メソッドのキーワード引数とハッシュ

def buy_burger(menu, drink, potato)
  # ハンバーガーを購入
  if drink
    # ドリンクを購入
  end
  if potato
    # ポテトを購入
  end
end

buy_burger("cheese", true, true)

# キーワード引数なら

def buy_burger(menu, drink: true, potato: true)
  # ハンバーガーを購入
  if drink
    # ドリンクを購入
  end
  if potato
    # ポテトを購入
  end
end

buy_burger("cheese", drink: true, potato: true)