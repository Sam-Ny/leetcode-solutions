class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        slow_p = 0

        for fast_p in range(len(nums)):
            if nums[fast_p] != 0:
                nums[slow_p], nums[fast_p] = nums[fast_p], nums[slow_p]
                slow_p += 1