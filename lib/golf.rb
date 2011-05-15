class Golf
  class << self
    def hole1 a
      a.inject :*
    end
  
    def hole2 s
      s.split.sort_by{|l| l[1]} * ' '
    end
  
    def hole3 n
      n == 1 ? 1 : n * hole3(n - 1)
    end
  
    def hole4 a
      a.map { |s|
        s =~ /man/ ? "hat(#{s})" : (s =~ /dog/ ? "#{s[0..-2]}(bone))" : s.sub("cat", "dead"))
      }
    end
  
    def hole5 a
      (1..a.size).inject([]){|s, i| s + a.each_cons(i).map}
    end
  
    def hole6 n
      f = "fizz"
      z = "buzz"
      (1..n).map{|i| i%15 == 0 ? f+z : (i%3 == 0 ? f : (i%5 == 0 ? z : i)) }
    end
  
    def hole7 a
      o = []
      s = a[0]
      1.upto(a.size-1){|i|
        if a[i] != a[i-1] + 1
          o << (s == a[i-1] ? s.to_s : "#{s}-#{a[i-1]}")
        
          s = a[i]
        end
      }
    
      o << "#{s}-#{a[-1]}" if s != a[-1]

      o
    end
  
    def hole8 n
      a = []
      0.upto(n-1){|i| 
        a << (i < 2 ? 1 : a[i-2]+a[i-1])
      }
      a
    end

    def hole9 f
      r = File.open(f).map{|l| l.strip.split(", ")}
      t = r.size/2.0
      
      loop {
        h = Hash.new(0)
        r.each{|l|
          h[l[0]] += 1 if l[0]
        }
        s = h.to_a.sort_by{|a| a[1]}
        
        s[-1][1] >= t || s.size == 1 ?
          (break s[-1][0]) :
          r.each{|l| l.delete s[0][0]}
      }
    end
  end
end
