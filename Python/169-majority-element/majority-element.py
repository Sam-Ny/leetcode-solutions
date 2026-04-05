''' Solution 1 | Time - O(n) | Space - O(n) '''
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        threshold = ceil(len(nums)/2)
        char_count = {}
        for c in nums:
            char_count[c] = char_count.get(c, 0) + 1
            if char_count[c] >= threshold:
                return c

''' Solution 2 (Boyer-Moore Voting Algorithm) | Time - O(n) | Space - O(1) '''
# class Solution:
#     def majorityElement(self, nums: List[int]) -> int:
#         curr_num = None
#         count = 0
        
#         for num in nums:
#             if count == 0:
#                 curr_num = num
            
#             # Increment if it's the candidate, decrement if not
#             count += (1 if num == curr_num else -1)
            
#         return curr_num

        