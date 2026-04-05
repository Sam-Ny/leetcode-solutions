''' Menthod 1 using Counter and Dictionary comprehension '''
# from collections import Counter
# class Solution:
#     def containsDuplicate(self, nums: List[int]) -> bool:
#         dict1 = dict(Counter(nums))
#         result =  any(value > 1 for value in dict1.values())
#         return True if result else False

''' Method 2 using Set comparision '''
from collections import Counter
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        if len(nums) == len(set(nums)):
            return False
        else:
            return True     