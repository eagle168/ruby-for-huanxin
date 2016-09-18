module Huanxin 
  module Group 

    #创建一个群组
    def create_group(name, desc, owner, is_public = true, maxusers = 200, is_approval = false, members = nil) 
      token =    self.auth_token()
      body  =    {groupname: name, desc: desc, public: is_public,  owner: owner, maxusers: maxusers, approval: is_approval}
      body.merge!({members: members}) unless members.nil?

      result = HTTParty.post("#{@head_url}/chatgroups", 
          :body => body.to_json,
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )

      if result.response.code.to_i == 200
        return result["data"]["groupid"] 
      else
        puts result.response.body.yellow
        nil
      end 
    end 
    #修改群组信息
    def modify_group(group_id, name, desc, maxusers = nil) 
      token =    self.auth_token()
      body  =    {groupname: name, description: desc}
      body.merge!({maxusers: maxusers}) unless maxusers.nil?

      result = HTTParty.put("#{@head_url}/chatgroups/#{group_id}", 
          :body => body.to_json,
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )


      if result.response.code.to_i == 200
        return result["data"]  #maxusers, groupname, description
      else
        puts result.response.body.yellow
        nil
      end 
    end
    #获取群组基本信息 
    def get_group_info(group_id) 
      token =    self.auth_token()

      result = HTTParty.get("#{@head_url}/chatgroups/#{group_id}", 
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )
      if result.response.code.to_i == 200
        return result["data"][0] 
      else
        puts result.response.body.yellow
        nil
      end 
    end 
    #删除一个群组 
    #
    def delete_group(group_id)
      token =    self.auth_token()

      result = HTTParty.delete("#{@head_url}/chatgroups/#{group_id}", 
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )

      if result.response.code.to_i == 200
        return [result["data"]["groupid"], result["data"]["success"]]
      else
        puts result.response.body.yellow
        nil
      end 
    end
    
    #获取群组所有成员
    def group_users(group_id)
      token = self.auth_token()

      result = HTTParty.get("#{@head_url}/chatgroups/#{group_id}/users", 
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )
      if result.response.code.to_i == 200
        return result["data"]
      else
        puts result.response.body.yellow
        nil
      end 
    end
    
    #加入群组
    def group_add_user(group_id, username)
      token = self.auth_token()

      result = HTTParty.post("#{@head_url}/chatgroups/#{group_id}/users/#{username}", 
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )
      if result.response.code.to_i == 200
        return result["data"]
      else
        puts result.response.body.yellow
        nil
      end 
    end

    #send message to group
    def group_send_cmd(group_id, action)
      token = self.auth_token()

      result = HTTParty.post("#{@head_url}/messages", 
          :body    => {target_type: "chatgroups",
                       target: [group_id],
                       msg: {
                         type: "cmd",
                         action: action,
                       },
                       from: "admin"}.to_json,
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )

      if result.response.code.to_i == 200
        return result["data"]
      else
        puts result.response.body.yellow
        puts @head_url.red
        nil
      end 
    end


    #send message to group
    def group_send_message(group_id, content)
      token = self.auth_token()

      result = HTTParty.post("#{@head_url}/messages", 
          :body    => {target_type: "chatgroups",
                       target: [group_id],
                       msg: {
                         type: "txt",
                         msg: content,
                       },
                       from: "admin"}.to_json,
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )

      if result.response.code.to_i == 200
        return result["data"]
      else
        puts result.response.body.yellow
        nil
      end 
    end


    #get groups by username
    def groups_by_username(username)
      token = self.auth_token()

      result = HTTParty.get("#{@head_url}/users/#{username}/joined_chatgroups",
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )

      if result.response.code.to_i == 200
        return result["data"]
      else
        puts result.response.body.yellow
        nil
      end 
    end

    #delete user from group
    def remove_member_from_group(group_id, username)
      token = self.auth_token()

      result = HTTParty.delete("#{@head_url}/chatgroups/#{group_id}/users/#{username}",
          :headers => { 'Content-Type' => 'application/json', 'Authorization'=>"Bearer #{token}" } )

      if result.response.code.to_i == 200
        return result["data"]
      else
        puts result.response.body.yellow
        nil
      end
    end


  end
end
