class ConnectAdapter
  def find(table, id)
    execute("select * from #{table} where id=#{id}").first
  end
  
  def find_all(table)
    execute("select * from #{table}")
  end
end



class PostgresAdapter < ConnectAdapter
  def initialize
    @conn = PG.connect :dbname => 'test'
  end
  
  def execute(sql)
    exec_result = []
    @conn.exec(sql) do |result|
      result.each do |row|
        exec_result << row
      end
    end
    
    exec_result
  end
end