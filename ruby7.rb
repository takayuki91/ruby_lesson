puts "---------------"
#  7.2 オブジェクト指向プログラミングの基礎知識

# 7.3.1 オブジェクトの作成とinitializeメソッド
# class User
#   def initialize
#     puts "initialized"
#   end
# end

# puts User.new

# class User
#   def initialize(name, age)
#     puts "name: #{name}, age: #{age}"
#   end
# end

# puts User.new("hoge", 25)

# 7.3.2 インスタンスメソッドの定義

# class User
#   def hello
#     "hello"
#   end
# end

# user = User.new
# puts user.hello

# puts "---------------"
#  7.3.3 インスタンス変数とアクセサメソッド

# インスタンス変数
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, I am #{@name}."
  end
end

user = User.new("hoge")
puts user.hello

# class User
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def neme=(value)
#     @name = value
#   end
# end

# user = User.new("Alice")
# user.name = "Bob"

# puts user.name

puts "==============="
# 練習

class Hello

  # クラスの初期化メソッド
  def initialize

  end

  # クラスのインスタンスメソッド
  def talk
    puts "hello, world"
  end

end

# newメソッドによるclassの初期化
hello = Hello.new

# Helloクラスのtalkメソッドを実行
puts hello.talk

puts "==============="

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

user = User.new("Alice")
puts user.name
user.name = "Bob"
puts user.name

# 読み取り専用 attr_teader
# 参照可能だが変更しようとするとエラー

# 書き込み専用 attr_writer
# @nemeを変更はできるが参照しようとするとエラー

puts "---------------"
class Human
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

user = Human.new("Alice", 25)
puts user.name
puts user.age
user.name = "Bob"
puts user.name
puts user.age
user.age = 30
puts user.name
puts user.age

puts "---------------"
# 7.3.4 クラスメソッドの定義

# class User
#   def initialize(name)
#     @name = name
#   end
  
#   def hello
#     "Hello, I am #{@name}."
#   end
# end

# alice = User.new("Alice")
# puts alice.hello

# bob = User.new("Bob")
# puts bob.hello

puts "---------------"

class User
  def initialize(name)
    @name = name
  end
  
  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end
  
  def hello
    "Hello, I am #{@name}."
  end
end

names = ["Alice", "Bob", "Carol"]
users = User.create_users(names)

users.each do |user|
  puts user.hello
end

puts "---------------"
# 7.3.5 定数
class Product
  DEFAULT_PRICE = 0
  
  attr_reader :name, :price
  
  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end
end

product = Product.new("A free movie")
puts product.name
puts product.price

# テスト