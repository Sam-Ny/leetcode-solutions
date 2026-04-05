''' Solution 1 - Using Sorted - O(nlogn) '''
# class Solution:
#     def isAnagram(self, s: str, t: str) -> bool:
#         if sorted(s) == sorted(t):
#             return True
#         else:
#             return False

''' Solution 2 - Using Counter - O(n) '''
from collections import Counter
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        return Counter(s) == Counter(t)

''' Solution 3 - Without using build-in libraries'''
# class Solution:
#     def isAnagram(self, s: str, t: str) -> bool:
#         if len(s) != len(t):
#             return False
#         char_count = {}

#         for char in s:
#             char_count[char] = char_count.get(char, 0) + 1
        
#         for char in t:
#             if char not in char_count or char_count[char] == 0:
#                 return False
#             char_count[char] -= 1
        
#         return True
