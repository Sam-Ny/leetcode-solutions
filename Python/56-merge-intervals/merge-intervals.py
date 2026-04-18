class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x:x[0])
        w_ptr = 0

        for r_ptr in range(1,len(intervals)):
            if intervals[w_ptr][1] >= intervals[r_ptr][0]:
                intervals[w_ptr][1] = max(intervals[w_ptr][1], intervals[r_ptr][1])
            else:
                w_ptr += 1
                intervals[w_ptr] = intervals[r_ptr]
        return intervals[:w_ptr + 1] 
