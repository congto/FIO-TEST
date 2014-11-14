# Hướng dẫn sử dụng FIO để kiểm tra hiệu năng ổ đĩa 
================================

# I. Giới thiệu về FIO 

FIO viết tắt của Flexible IO Tester là công cụ được sử dụng để cho phép test hiệu năng của ổ cứng. 

# II. FIO làm việc như thế nào

Bước đầu tiên là mô phỏng các công việc, sau đó viết viết 1 job file mô phỏng quá trình cài đặt. Trong job file sẽ chứa các phân đoạn global được sử dụng để chia sẻ các parameters, một hoặc nhiều tiến trình có thể được đặt trong file job này. Khi file job này chạy sẽ phân tích file và thiết lập mọi thứ như trong file yêu cầu.

# III. Quá trình tiến hành kiểm tra

## 3.1 Quá trình tạo 
- B1: Add 1 ổ cứng vào
- B2: Tạo partition và mount vào 1 thư mục. Ở đây mình mount ở cứng vừa được add vào đường link sau: `/partition/data`
- B3: Chạy lệnh sau: `apt-get install fio`

- B4: Sử dụng lệnh `vi` Tạo 1 file như sau với nội dung như sau : 

```sh 
[randread]
ioengine=libaio
iodepth=1
rw=randread
bs=4k,4k
direct=1
numjobs=1
size=500m
directory=/partition/data
```

Giải thích một số parameters:
- rw có thể nhân giá trị sau:
  <ul>
  <li>randread:    Đọc ngẫu nhiên</li>
  <li>randwrite:   Ghi ngẫu nhiên</li>
  <li>randrw:      Cả đọc và ghi ngẫu nhiên</li>
  <li>read:        Đọc tuần tự</li>
  <li>write:       Ghi tuần tự</li>
  <li>rw,readwrite:    Cả đọc và ghi tuần tự</li>
 </ul>
- bs = 4k,4k: block size là 4k
- numjobs = 1: 1 tiến trình được thực hiện 
- size = 500m: Quá trình đọc file là 500MB
- directory = /partition/data: kiểm tra test trên thư mục data
 
- B5: Sau khi tạo xong file ta thực hiện lệnh sau: `fio randread.fio`

##3.2 Một số ví dụ

3.2.1 Kiểm tra quá trình ghi:
```sh
[seqWrites]
ioengine=libaio
iodepth=8
rw=write
bs=4,4k
direct=1
numjobs=1
size=1g
directory=/partition/data<br>
```
3.2.2 Có thể tạo ra đồng thời nhiều quá trình ghi file bằng thay đổi giá trị numjobs
```sh
[randread]
ioengine=libaio
iodepth=1
rw=randread
numjobs=4
size=500m
directory=/partition/data
```
#IV. Các tài liệu tham khảo 

http://git.kernel.dk/?p=fio.git;a=blob;f=HOWTO;h=ea8730caea033ec4fce10d00ceef7256170bfd8e;hb=HEAD

http://git.kernel.dk/?p=fio.git;a=tree;f=examples;h=429dbcedeb7db411f3cac0789a3413cd96b4a516;hb=HEAD`

http://www.linux.com/learn/tutorials/442451-inspecting-disk-io-performance-with-fio/
