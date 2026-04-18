class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        pairs = {}

        for word in strs:
            sorted_word = "".join(sorted(word))
            pairs[sorted_word] = pairs.get(sorted_word, []) + [word]
        return [values for values in pairs.values()]
