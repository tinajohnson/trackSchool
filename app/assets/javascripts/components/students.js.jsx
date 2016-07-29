var Students = React.createClass({

    getInitialState() {
        return {
            students: this.props.students,
            student: {
                name:'',
                standard: '',
                section: '',
                school: ''
            },
            filteredData: ''
        }
    },

    search(e) {
        e.preventDefault();
        const regex = new RegExp(e.target.value, 'i');
        const filtered = this.props.students.filter(function(student) {
            return (student.name.search(regex) > -1)||(student.standard.search(regex) > -1)||(student.section.search(regex) > -1);
        });

        this.setState({
            students: filtered
            // students: studentList
        });

    },
    handleNameChange(e) {
        var newStudent = this.state.student;
        newStudent.name = e.target.value;
        this.setState({student: newStudent});
    },

    handleStandardChange(e) {
        var newStudent = this.state.student;
        newStudent.standard = e.target.value;
        this.setState({student: newStudent});
    },

    handleSectionChange(e) {
        var newStudent = this.state.student;
        newStudent.section = e.target.value;
        this.setState({student: newStudent});
    },

    addNewStudent() {
        var that = this;
        $.ajax({
            method: 'POST',
            data: {
                student: that.state.student,
            },
            url: 'students/',
            success: function(res) {
                var newStudentList = that.state.students;
                newStudentList.push(res);
                that.setState({
                    students: newStudentList,
                    student: {
                        name:'',
                        standard: '',
                        section: '',
                        school: ''
                    }
                });
            }
        });
    },


    render: function() {
        students = this.state.students.map( function(student) {
            return (
                <Student student={student} key={student.id} onRemoveStudent="handleStudentRemove"/>
            );
        });
        return (
            <div>
                <h1>Listing Students</h1>
                <div id="students">
                    <input
                        type="text"
                        onChange={ this.search }
                        placeholder="Search" />
                    <table>
                        <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Standard</th>
                            <th>Section</th>
                        </tr>
                        </thead>
                        <tbody>
                        {students}
                        <tr>
                            <td><a href={this.addNew}>New Student</a></td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="text" placeholder="Enter new student name" onChange={this.handleNameChange} /><br />
                    <input type="text" placeholder="Enter standard" onChange={this.handleStandardChange} /><br />
                    <input type="text" placeholder="Enter section" onChange={this.handleSectionChange} /><br />
                    <button class="waves-effect waves-light btn" onClick={this.addNewStudent}>New Student</button>
                </div>
            </div>
        );
    },

    handleStudentRemove(student) {
        var studentList = this.state.students.filter(function(item) {
            return student.id !== item.id;
        });
        this.setState({
            students: studentList
        });
    }
    
});

