#tag Class
Protected Class AVW_settings_print_each_iterator
Inherits AVW_settings_module.AVW_settings_iterator
	#tag Method, Flags = &h0
		Sub apply(key as string, asetting as AVW_settings_module.AVW_settings_a_setting)
		  #Pragma unused key
		  #Pragma unused asetting
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(print_to as AVW_util.outputer)
		  outer=print_to
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		#tag Note
			Super.Constructor
		#tag EndNote
		Protected outer As AVW_util.outputer
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
	#tag EndViewBehavior
End Class
#tag EndClass
