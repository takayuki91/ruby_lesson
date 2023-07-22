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

# ローカル変数
class User
  