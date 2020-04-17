#tag Class
Protected Class AVW_settings
	#tag Method, Flags = &h0
		Sub check()
		  For Each key_variant As Variant In the_data.Keys
		    Var key As String=key_variant
		    Var asetting As AVW_settings_a_setting=the_data.lookup(key,Nil)
		    If Not asetting.is_set Then
		      Raise New AVW_settings_error_missing_setting(key)
		    End If
		  Next key_variant
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  the_data=New Dictionary
		  set_eol(Chr(10))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub define(name as string)
		  the_data.value(name)=New AVW_settings_a_setting(False,False,"")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub define_default(name as string, val as string)
		  the_data.value(name)=New AVW_settings_a_setting(True,True,Val)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub for_each_setting(some_iterator as AVW_settings_iterator)
		  For Each key_variant As Variant In the_data.Keys
		    Var key As String=key_variant
		    Var asetting as AVW_settings_a_setting=the_data.lookup(key,Nil)
		    some_iterator.apply(key,asetting)
		  Next key_variant
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_integer(key as string) As integer
		  Return get_setting_value(key).Val.ToInteger
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function get_setting_value(key as string) As AVW_settings_a_setting
		  Var asetting As AVW_settings_a_setting=the_data.lookup(key,Nil)
		  If asetting=Nil Then
		    Raise New AVW_settings_error_no_such_key(key)
		  End If
		  Return asetting
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_string(key as string) As string
		  Return get_setting_value(key).Val
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function has_setting(key as string) As boolean
		  Return the_data.HasKey(key)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub read_file(outer as AVW_util.outputer, file_path as string)
		  outer.outs("reading uci_icc_player config :"+file_path)
		  Var input_folder_item As FolderItem=New FolderItem(file_path,FolderItem.pathModes.Native)
		  Var  parent_path As String=AVW_util.get_parent_path(input_folder_item)
		  Var line_number_string As String="1"
		  Try
		    Var input_stream As TextInputStream=TextInputStream.Open(input_folder_item)
		    If input_stream = Nil Then
		      Raise New AVW_settings_error_reading_config_file(file_path)
		    End If
		    Var line_number As Integer=0
		    Var reg_comment As RegEx=New RegEx
		    reg_comment.SearchPattern = "^([\s]*#.*)"
		    Var reg_setting As RegEx=New RegEX
		    reg_setting.SearchPattern="^([A-Za-z0-9_]+)(\+?):(.*)$"
		    Do
		      Var aline As String=input_stream.ReadLine
		      line_number=line_number+1
		      line_number_string=line_number.ToString
		      If aline.length <1 Then
		        Continue
		      End If
		      Var matcher As RegExMatch
		      matcher=reg_comment.Search(aline)
		      If matcher<>Nil Then
		        Continue
		      End If
		      matcher=reg_setting.Search(aline)
		      If matcher=Nil Then
		        Raise New AVW_settings_error_reading_config_file("invalid input on line #"+line_number_string+" file:"+file_path)
		      End If
		      Var var_name As String=matcher.SubExpressionString(1)
		      Var append_operator As String=matcher.SubExpressionString(2)
		      Var var_value As String=matcher.SubExpressionString(3)
		      If var_name="include" Then
		        Var include_file_name As String=parent_path+var_value
		        outer.outs("#switching from "+file_path+" line #"+line_number_string+" to:"+include_file_name)
		        read_file(outer,include_file_name)
		        outer.outs("#switching back to "+file_path+" line #"+line_number_string)
		        Continue
		      End If
		      If append_operator="+" Then
		        Var buf As String=get_string(var_name)
		        var_value=buf+AVW_util.get_unix_end_of_line+var_value
		      End If
		      If Not has_setting(var_name) Then
		        Raise New AVW_settings_error_no_such_key(var_name)
		      End
		      Var asetting As AVW_settings_a_setting=get_setting_value(var_name)
		      asetting.is_set=True
		      asetting.Val=var_value
		    Loop Until input_stream.EndOfFile
		    input_stream.close
		  Catch e As IOException
		    Raise New AVW_settings_error_reading_config_file("IOException trying to read "+file_path+" line #"+line_number_string)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set_eol(some_eol as string)
		  multi_line_eol=some_eol
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		multi_line_eol As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected the_data As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="multi_line_eol"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
