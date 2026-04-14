""" Time Complexity O(n), Space Complexity O(1) """
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        if not prices:
            return 0
        min_p = prices[0]
        diff = 0

        for price in prices:
            if price < min_p:
                min_p = price
            
            elif price - min_p > diff:
                diff = price - min_p
        
        return diff