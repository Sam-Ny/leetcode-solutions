class Solution:
    def isPalindrome(self, s: str) -> bool:
        low_s = s.lower()
        s2 = ("").join([i for i in low_s if i.isalnum() == True])
        return True if s2 == s2[::-1] else False
        