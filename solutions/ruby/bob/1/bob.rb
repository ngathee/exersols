module Bob
  def self.hey(remark) 
    remark.strip! 
    question = remark.match?(/\A[A-Za-z0-9!\.\?\-\+\*\^\\\|\$\(\)\[\]\{\},: ]+\?\Z/)
    yell = remark.match?(/(?!^[\d ,]+$)\A[A-Z \%\\^\*\@\\\#\$\(0-9!,]+\Z/)
    yell_question = remark.match?(/\A[A-Z\\.\\?\\-\\+\\*\\^\\|\\$\\(\\)\\[\\]\\{\\' ]+\?\Z/)
    silence = remark.match?(/^\s*$/)
    case 
    when question then "Sure."
    when yell then "Whoa, chill out!"
    when yell_question then "Calm down, I know what I'm doing!"
    when silence then "Fine. Be that way!" 
    else "Whatever." 
    end 
  end
end 

