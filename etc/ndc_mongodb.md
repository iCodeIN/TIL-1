## mongodb

* 3.4 기준 설명
* 스토리지 엔진 두개중에 하나를 선택해서 사용
  * 두개중 어떤 것을 선택하냐에 따라 성능이나 사용방법이 차이남



#### Storage Engine

* MMAPv1
  * Power of 2 sized allocate or no padding
    * 32, 64.. 2MB
  * In-place update
  * Throughput 1x
* wiredtiger
  * document level concurrency
  * No in-place update
  * Compression
    * all collections, indexes
    * snappy, zlib..
  * Throughput 7x~10x (unstable)
  * 3.2 이상에서 사용할 것을 권장



#### Indexes

* Multikey, unique, sparse, partial, text, ...