""" Time Complexity O(nlogn) Space O(n)"""
# class Solution:
#     def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
#         pairs = {}

#         for word in strs:
#             sorted_word = "".join(sorted(word))
#             pairs[sorted_word] = pairs.get(sorted_word, []) + [word]
#         return [values for values in pairs.values()]

""" Time Complexity O(nlogn) Space O(n)"""
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        pairs = {}

        for word in strs:
            sorted_word = "".join(sorted(word))
            if sorted_word not in pairs:
                pairs[sorted_word] = []
            pairs[sorted_word].append(word)
        return [values for values in pairs.values()]