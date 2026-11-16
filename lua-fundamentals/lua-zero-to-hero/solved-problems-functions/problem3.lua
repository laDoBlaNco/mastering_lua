--[[
We want to send a postcard by mail. We need a stamp worth n cents.
Stamps have values 7 and 4 cents. As space is limited we want to know
the minimum number of stamps we need to put on the postcards, without
losing a cent.

Write a function stamps(n) that givne an integer number n it returns
two numbers p >= 0 and q >= 0 such that n = 7p + 4q and P+q is
minimum among all possible choices
]]

function stamps(n)
	local p = 0
	local q = 0

	while n >= 4 and n % 7 ~= 0 do
		q = q + 1
		n = n - 4
	end
	p = math.floor(n / 7)
	return p, q
end

print(stamps(20))
print(stamps(31))
print(stamps(53))
print(stamps(127))
