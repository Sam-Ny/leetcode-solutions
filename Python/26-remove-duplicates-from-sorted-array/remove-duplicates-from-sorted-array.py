""" Time Complexity O(n), Space Complexity - O(1) - InPlace """
class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        curr_idx = 1

        for i in range(1,len(nums)):
            if nums[i] != nums[i-1]:
                nums[curr_idx] = nums[i]
                curr_idx += 1
        return curr_idx
