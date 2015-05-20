#import <Foundation/Foundation.h>

NSMutableArray* Merge(NSArray *leftArray, NSArray *rightArray, NSArray *inputArray){
  
  NSMutableArray *outputArray = [[NSMutableArray alloc] initWithCapacity:inputArray.count];
  
  NSUInteger lengthOfRightArray = rightArray.count;
  NSUInteger lengthofLeftArray = leftArray.count;
  
  NSUInteger k = 0; NSUInteger j = 0; NSUInteger i = 0;
  
  while (i<lengthofLeftArray && j<lengthOfRightArray) {
    
    if(leftArray[i]<=rightArray[j]){
      outputArray[k] = leftArray[i];
      i++;
    }
    else{
      outputArray[k] = rightArray[j];
      j++;
    }
    k++;
  }
  
  while (i<lengthofLeftArray) {
    outputArray[k] = leftArray[i];
    i++;
    k++;
  }
  while (j<lengthOfRightArray) {
    outputArray[k] = rightArray[j];
    j++;
    k++;
  }
  
  return outputArray;
}

NSArray* MergeSort(NSArray *inputArray){
  
  NSUInteger lengthOfArray = inputArray.count;
  
  if (lengthOfArray<=1){
    return inputArray;
  }
  
  NSUInteger midPointOfArray = (int) lengthOfArray/2;
  
  NSArray *leftArray = [inputArray subarrayWithRange:NSMakeRange(0, midPointOfArray)];
  NSArray *rightArray = [inputArray subarrayWithRange:NSMakeRange(midPointOfArray, midPointOfArray)];
  
  leftArray = MergeSort(leftArray);
  rightArray = MergeSort(rightArray);
  return Merge(leftArray, rightArray, inputArray);
  
}

int main(int argc, const char *argv[]){
  @autoreleasepool {
    
    NSArray *inputArray = @[@2,@6,@1,@0,@8,@9,@3,@12,@1];
    
    NSArray *outputArray = MergeSort(inputArray);
    
    NSLog(@"input array: %@, output array: %@",inputArray,outputArray);
    
  }
  
  return 0;
}
