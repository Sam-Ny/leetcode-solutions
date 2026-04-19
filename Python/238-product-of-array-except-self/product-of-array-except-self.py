""" Time Complexity O(n2) Space O(n)"""
# from math import prod
# class Solution:
#     def productExceptSelf(self, nums: List[int]) -> List[int]:
#         prod_lst = []
#         for i in range(len(nums)):
#             prod_except_n = prod(nums[:i]) * prod(nums[i+1:])
#             prod_lst.append(prod_except_n)
#         return prod_lst

""" Time complexity O(n) Space O(n)"""
class Solution:
    def productExceptSelf(self, nums: list[int]) -> list[int]:
        n = len(nums)
        res = [1] * n
        
        prefix = 1
        for i in range(n):
            res[i] = prefix
            prefix *= nums[i]  

        suffix = 1
        for i in range(n - 1, -1, -1):
            res[i] *= suffix
            suffix *= nums[i]
            
        return res

