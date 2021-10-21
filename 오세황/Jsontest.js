import $ from "jquery";
import React from "react";

function Jsontest() {
  const getData = () => {
    $.ajax({
      url: "http://localhost:8081/testjson.do",
      type: "post",
      success: function (json) {
        var html = "";
        for (var i = 0; i < json.length; i++) {
          html += `<option>${json[i]}</option>`;
        }
        console.log(html);
        $(".test").html(html);
      },
      error: function (error) {
        console.log(error);
      },
    });
  };
  return (
    <>
      <center>
        <select className="test"></select>
        <input type="button" value="데이터 가져오기" onClick={getData} />
      </center>
    </>
  );
}

export default Jsontest;
