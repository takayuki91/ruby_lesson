# RGB変換プログラム

# def to_hex(r, g, b)
#   "#" +
#     r.to_s(16).rjust(2, "0") +
#     g.to_s(16).rjust(2, "0") +
#     b.to_s(16).rjust(2, "0")
# end

# puts to_hex(4, 60, 120)

# # 3〜8行をリファクタリング
# def to_hex(r, g, b)
#   hex = "#"
#   [r, g, b].each do |n|
#     hex += n.to_s(16).rjust(2, "0")
#   end
# end

# 13〜18行をリファクタリング
def to_hex(r, g, b)
   [r, g, b].sum("#") do |n|
     n.to_s(16).rjust(2, "0")
   end
end

puts to_hex(4, 60, 120)

# def to_ints(hex)
#   r = hex[1..2]
#   g = hex[3..4]
#   b = hex[5..6]
#   ints = []
#   [r, g, b].each do |s|
#     ints << s.hex
#   end
#   ints
# end

# puts to_ints("#ffffff")

# 29〜38をリファクタリング
# def to_ints(hex)
#   r = hex[1..2]
#   g = hex[3..4]
#   b = hex[5..6]
#   [r, g, b].map do |s|
#     s.hex
#   end
# end

# puts to_ints("#043c78")

# 43〜50をリファクタリング
def to_ints(hex)
  r, g, b = hex[1..2], hex[3..4], hex[5..6]
  [r, g, b].map(&:hex)
end

puts to_ints("#043c78")
