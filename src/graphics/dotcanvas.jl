const dot_signs = [0b10 0b01]

const dot_decode = Array(Char, 5)
dot_decode[0b00 + 1] = ' '
dot_decode[0b01 + 1] = '.'
dot_decode[0b10 + 1] = '\''
dot_decode[0b11 + 1] = ':'

type DotCanvas <: LookupCanvas
  grid::Array{UInt8,2}
  colors::Array{UInt8,2}
  pixel_width::Int
  pixel_height::Int
  origin_x::Float64
  origin_y::Float64
  width::Float64
  height::Float64
end

@inline x_pixel_per_char(::Type{DotCanvas}) = 1
@inline y_pixel_per_char(::Type{DotCanvas}) = 2

@inline lookup_encode(c::DotCanvas) = dot_signs
@inline lookup_decode(c::DotCanvas) = dot_decode

@inline function DotCanvas(args...; nargs...)
    CreateLookupCanvas(DotCanvas, args...; nargs...)
end
