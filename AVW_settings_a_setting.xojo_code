#tag Class
Protected Class AVW_settings_a_setting
	#tag Method, Flags = &h0
		Sub Constructor(ahas_default as boolean, ais_set as boolean, aval as string)
		  has_default=ahas_default
		  is_set=ais_set
		  Val=aval
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub outs(the_printer as AVW_settings_printer, keystring as string)
		  Var outme As String="key="+keystring
		  outme=outme+" val="+Val
		  the_printer.outs(outme)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		has_default As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		is_set As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		val As string
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
			Name="val"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="is_set"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="has_default"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
