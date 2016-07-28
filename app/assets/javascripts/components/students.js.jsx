var Students = React.createClass({

    getInitialState() {
        return {
            students: this.props.students,
        }
    },




    render: function() {
        students = this.props.students.map( function(student) {
            return (
                <Student student={student} key={student.id} />
            );
        });
        return (
            <div>
                <h1>Listing Students</h1>
                <div id="students">
                    <table>
                        <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Class</th>
                        </tr>
                        </thead>
                        <tbody>
                        {students}
                        <tr>
                            <td><a href={this.addNew}>New Student</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        );
    }
});

