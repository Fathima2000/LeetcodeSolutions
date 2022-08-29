class Solution {
    public int[] frequencySort(int[] nums) {
        
				 // //Method 1 -> Using stream
				 // HashMap<Integer, Integer> map = new HashMap<>();
				 // for(int i=0;i<nums.length;i++){
				 // if(map.containsKey(nums[i]))
				 // map.put(nums[i],map.get(nums[i])+1);
				 // else
				 // map.put(nums[i],1);
				 // }
				 // return Arrays.stream(nums) // create a stream of int from the int[] array
				 // .boxed() // convert int to Integer
				 // .sorted((i1, i2) -> map.get(i1).equals(map.get(i2)) ? // if frequencies are same
				 // Integer.compare(i2, i1) ://thn cmpare vals for descendng order
				 // Integer.compare(map.get(i1), map.get(i2)))//else cmpare frequncies
				 // .mapToInt(Integer::intValue) // convert Integer to int
				 // .toArray(); // collect in an int[] array
        
        
        
        
//         //Method 2 - Collection.sort on Array
//         //store frequency in hashmap 
//         LinkedHashMap<Integer,Integer> hm= new LinkedHashMap<Integer,Integer>();
        
//         for(int n : nums)
//         {
//             if(hm.containsKey(n))
//                 hm.put(n,hm.get(n)+1);
//             else
//                 hm.put(n,1);
//         }
        
// 		//create array list of hashmap's entrySet so that we can perform Collections.sort on it. 
//         ArrayList<Map.Entry<Integer,Integer>> al = new ArrayList<Map.Entry<Integer,Integer>>(hm.entrySet());
        
// 		//compare method logic according to problem 
//         Collections.sort(al, new Comparator<Map.Entry<Integer, 
//                                      Integer>>(){
//         public int compare(  Map.Entry<Integer, Integer> o1,
//                     Map.Entry<Integer, Integer> o2)
//             {
//                if (o1.getValue() == o2.getValue())
//                         return o2.getKey() - o1.getKey();
//                     else
//                         return o1.getValue() - o2.getValue();
        
//             }});
        
//         System.out.println(al.toString());
        
//         int sol[]= new int[nums.length];
//         //store result in solution array 
//         int i=0;
//         for(Map.Entry entry: al){
//             int val = (Integer)entry.getValue();
//             while(val-->0)
//                 sol[i++] = (Integer)entry.getKey();
//         }
//         return sol;
        
        Map<Integer,Integer>map=new HashMap<>();
        for(int val : nums)
            map.put(val,map.getOrDefault(val,0)+1);
        PriorityQueue<int[]>pq=new PriorityQueue<>((a,b)->b[1]!=a[1] ? a[1]-b[1] : b[0]-a[0]);
        for(Map.Entry<Integer,Integer>m : map.entrySet())
            pq.add(new int[]{m.getKey(),m.getValue()});
        int i=0;
        while(!pq.isEmpty()){
            int a[]=pq.poll();
            while(a[1]-->0)
                nums[i++]=a[0];
        }
        return nums;
    }
}
