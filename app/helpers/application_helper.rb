# coding: utf-8

module ApplicationHelper
	def show_date_now
		wdays = %w(Понедельник Вторник Среда Четверг Пятница Суббота Воскресение)
		date = DateTime.now
		wdays[ date.wday - 1 ] + ", " + l(date, :format => :long)
	end


	def content_block(args = {}, &block)
		content = 
		'
		<table class="eBlock" border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tbody>
		    <tr>
		      <td style="padding:3px;">
		        <div class="eTitle" style="text-align:left;">
		          <h3>'
		content += args[:title]
		content += '
		            
		          </h3>
		        </div>
		        <div class="eMessage" style="text-align:left;clear:both;padding-top:2px;padding-bottom:2px;">
		        ' + capture(&block) + '
		        </div>
		      </td>
		    </tr>
		  </tbody>
		</table>
		'
		
		return content.html_safe
	end
end
