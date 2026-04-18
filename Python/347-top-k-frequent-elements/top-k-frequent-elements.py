class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        frequency = {}

        for i in nums:
            frequency[i] = frequency.get(i,0) + 1

        freq = sorted(frequency.items(), key=lambda item: item[1], reverse = True)
        return [item[0] for item in freq[:k]]
